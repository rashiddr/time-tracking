class Project < ApplicationRecord
	has_many:users
	has_many:daily_statuses
	validates :project_name, presence: true, uniqueness: true, length: { maximum:25 }
	validates :client, presence:true
	def self.latest_projects
		order("created_at DESC").limit(12)
	end
end
