class ListProjectsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@projects=Project.order("created_at DESC").limit(12)
	end
end
