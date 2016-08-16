class Project < ApplicationRecord
	has_many:users, through: :user_projects
	has_many:user_projects
	has_many:daily_statuses
	belongs_to :project_head, :class_name => "User",
    :foreign_key => "project_manager"
	belongs_to :user, :foreign_key => :project_manager
	validates :project_name, presence: true, uniqueness: true, length: { maximum:25 }
	validates :client, presence:true
	validates :project_manager, presence:true
	def self.latest_projects
		order("created_at DESC").limit(9)
	end
	def self.select_managers_projects(user_id)
		where(project_manager: user_id)
	end
	def self.project_list
		includes(:project_head).all.order("created_at DESC")
	end
end
