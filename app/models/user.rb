class User < ApplicationRecord
  acts_as_birthday :dob
  has_many:projects
  has_many:daily_statuses
  has_many:comments

  has_attached_file :user_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :user_pic, content_type: /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:Manager, :employe]
  validates :user_pic, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :user_pic
  validates_with AttachmentSizeValidator, attributes: :user_pic, less_than: 3.megabytes
  validates :first_name, presence: true, length: { maximum:15 }
  validates :first_name, length: { maximum:15 }
  validates :place, presence:true, length: { maximum:15 }
  validates :dob, presence:true
  validates :username, presence:true, uniqueness: true, length: { maximum:15 }
  validates_date :dob, :on_or_before => lambda { Date.current - 15.years},
                 :on_or_before_message => 'must be atleast 15 years ago'

  end
                 
