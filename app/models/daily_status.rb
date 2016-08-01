class DailyStatus < ApplicationRecord
	belongs_to:user
	belongs_to:project
	attr_accessor :project_name
	validates :user_id, uniqueness: { scope: [:status_date, :project_id] }
	validates :status_date, presence: true
  	validates :project_id, presence: true
  	validates :duration, presence:true
  	validates :work_done, presence:true
  	validates_date :status_date, :on_or_before => lambda { Date.current },
                                 :on_or_before_message => 'must be less than or equal to today',
							 	 :on_or_after => lambda { 7.days.ago },
							 	 :on_or_after_message => "Status date must be after #{Date.today - 7.days} "


end
