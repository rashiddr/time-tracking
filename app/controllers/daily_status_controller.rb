class DailyStatusController < ApplicationController
	def new
		@daily_status=  DailyStatus.new()
		@project_list = Project.all()
	end
end
