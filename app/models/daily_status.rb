class DailyStatus < ApplicationRecord
	belongs_to:user
	belongs_to:project
	attr_accessor :project_name
	validates :user_id, uniqueness: { scope: [:status_date, :project_id] }
	validates :status_date, presence: true
  	validates :project_id, presence: true
  	validates :duration, presence:true
  	validates :work_done, presence:true
end
