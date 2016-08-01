class VerifyStatusesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin
	def index
		if(params[:user])
			@daily_status=DailyStatus.includes(:project,:user).where(status_date: params[:search_date],user_id: params[:user][:user_id] ).order("created_at DESC")
		else
			@daily_status=DailyStatus.includes(:project,:user).where(status_date: params[:search_date]).order("created_at DESC")
		end 
	end
end




