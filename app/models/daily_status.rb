class DailyStatus < ApplicationRecord
	belongs_to:user
	belongs_to:project
	attr_accessor :project_name
end
