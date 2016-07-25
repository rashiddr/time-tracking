class Project < ApplicationRecord
	has_many:users
	has_many:daily_statuses
	validates :project_name, presence: true, uniqueness: true, length: { maximum:25 }
	validates :client, presence:true
end
