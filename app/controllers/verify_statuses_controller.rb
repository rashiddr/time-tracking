class VerifyStatusesController < ApplicationController
	def index
		@daily_status=DailyStatus.where(checked: false).order("created_at DESC").all
	end
	def update
		@daily_status= DailyStatus.find(params[:id]) 
		@daily_status.checked= true
		@daily_status.update(params)
  		redirect_to verify_statuses_path
	end
end
