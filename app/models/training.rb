class Training < ApplicationRecord
	validates :title, presence: true, length: { maximum:25 }
	validates :trainer, presence:true
	validates :training_date, presence:true
	validates :location, presence:true
	validates_date :training_date,:after => lambda { Date.today },
							 	 :after_message => "must be after #{Date.today} "

	def self.latest_training
		where(training_date: Date.today..Date.today + 30.days)
	end
end
