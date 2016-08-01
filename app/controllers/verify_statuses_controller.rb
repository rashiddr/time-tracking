class VerifyStatusesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin
	def index
		if(params[:search_date].blank? && params[:user].blank?)
			@daily_status=DailyStatus.includes(:project,:user).where(status_date: Date.today - 1.days).order("created_at DESC")
		elsif(params[:search_date].blank?)
			@daily_status=DailyStatus.includes(:project,:user).where(user_id: params[:user][:user_id] ).order("created_at DESC")	
		elsif(params[:user][:user_id].blank?)
			@daily_status=DailyStatus.includes(:project,:user).where(status_date: params[:search_date]).order("created_at DESC")
		else
			@daily_status=DailyStatus.includes(:project,:user).where(status_date: params[:search_date], user_id: params[:user][:user_id] ).order("created_at DESC")
		end 
	end
end




