class Training < ApplicationRecord
	before_save :set_training_datetime
	attr_accessor :training_time, :training_date, :current_user
	validates :title, presence: true, length: { maximum:25 }
	validates :trainer, presence:true
	validates :training_date, presence:true
	validates :training_time, presence:true
	validates :duration, presence:true
	validates :location, presence:true
	validates_date :training_date,:after => lambda { Date.today },
							 	 :after_message => "must be after #{Date.today} "

	def self.latest_training
		where(training_datetime: Date.today..Date.today + 20.days).order("created_at DESC")
	end
	def self.all_training
		where("training_datetime > ?",Date.today).order("created_at DESC")
	end
	def set_training_datetime
	    if training_date.present? && training_time.present?
	    	Time.zone=current_user.location.time_zone
	        self.training_datetime=Time.zone.parse("#{training_date} #{training_time}")
	    end
  	end
end
