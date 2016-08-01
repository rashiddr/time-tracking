class ListProjectsController < ApplicationController
	def index
		@projects=Project.order("created_at DESC").limit(12)
	end
end
