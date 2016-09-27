class User < ApplicationRecord
  after_initialize :default_values
  acts_as_birthday :dob #for birthday
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :daily_statuses,dependent: :destroy
  has_many :comments
  has_one :location
  attr_accessor :omni_auth
  has_attached_file :logo,styles: { medium: "300x300>", thumb: "100x100>" },default_url: "/images/logo_white_:style.png"
  has_attached_file :user_pic, styles: { medium: "300x300#", thumb: "100x100#", smallthumb: "34x34#" }, default_url: "/images/default_:style.png"
  validates_attachment_content_type :user_pic, content_type: /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook,:google_oauth2]
  enum role: [:Manager, :Employe]
  validates_with AttachmentSizeValidator, attributes: :user_pic, less_than: 3.megabytes
  validates :first_name, presence: true, length: { maximum:25 }
  validates :last_name, length: { maximum:15 }
  validates :place, presence:true, length: { maximum:15 }, unless: :omni_auth
  validates :dob, presence:true, unless: :omni_auth
  validates :username, presence:true,length: { maximum:30 }, unless: :omni_auth
  validates_date :dob, on_or_before: lambda { Date.current - 15.years},
                  on_or_before_message:'must be atleast 15 years ago',
                  unless: :omni_auth
  def self.new_joiners
    where(created_at:Date.today - 20.days..Date.today)
  end
  def self.users_list
    order("created_at DESC")
  end
  def self.select_users_with_location
    where(id: Location.pluck(:user_id))
  end
  def self.profile_completed(user_id)
    find(user_id).update(profile_completion: true)
  end
  def self.birthday_ordered_asc
    find_dobs_for(Date.today, Date.today + 15.days).order("EXTRACT(MONTH FROM dob) ASC","EXTRACT(DAY FROM dob) ASC")
  end  
  def self.add_admins(user_id)
    where(id: user_id).update_all(role: 0)
  end
  def self.list_admins
    where(role: 0)
  end
  def self.select_available_users(projects_id)#select users who are not already in this projects
   User.where('id NOT IN (?)',UserProject.select("user_id").where(project_id: projects_id).distinct.pluck(:user_id).presence || [0]) 
  end
  def self.select_trainees
    order("created_at DESC").limit(5);
  end
  def self.search_users(pattern)
    where("first_name LIKE ? or last_name LIKE ? or concat(first_name, ' ', last_name) LIKE ?", "#{pattern}%", "#{pattern}%" , "#{pattern}%")
  end
  def self.select_user(user_id)
    where(id:user_id)
  end
  def self.from_omniauth_facebook(auth)
    require 'open-uri'
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name= auth.extra.raw_info.first_name
      user.last_name= auth.extra.raw_info.last_name
      user.username= auth.info.name.delete(' ').downcase
      user.omni_auth=true
      user.user_pic= URI.parse(auth.info.image).open()
      user.save!
    end
  end
  def self.from_omniauth_google(auth)
    require 'open-uri'
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name= auth.info.first_name
      user.last_name= auth.info.last_name
      user.user_pic= URI.parse(auth.info.image).open()
      user.omni_auth=true
      user.save!
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  private
    def default_values
      self.role ||= "Employe"
    end
end
                 
