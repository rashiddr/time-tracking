class User < ApplicationRecord
  acts_as_birthday :dob
  has_many:projects
  has_many:daily_statuses
  has_many:comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:Manager, :employe]
  validates :first_name, presence: true, length: { maximum:15 }
  validates :first_name, length: { maximum:15 }
  validates :place, presence:true, length: { maximum:15 }
  validates :dob, presence:true
  validates :username, presence:true, uniqueness: true, length: { maximum:15 }
end
