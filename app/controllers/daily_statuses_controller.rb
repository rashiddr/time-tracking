class DailyStatusesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin, :only => [:verify_statuses]
	def index
		@daily_status=DailyStatus.includes(:project).where(user_id: current_user.id).all.order("created_at DESC")
	end
	def new
		@daily_status=  DailyStatus.new()
		@project_list = Project.all()
	end
	def create
		@daily_status= DailyStatus.new(status_params)
		@daily_status.user_id=current_user.id
		if(@daily_status.save)
  			redirect_to @daily_status
  		else
  			render 'new'
  		end
	end
	def edit
		@daily_status= DailyStatus.find(params[:id])
	end
	def update
		@daily_status= DailyStatus.find(params[:id]) 
		if(@daily_status.update(status_params))
  			redirect_to @daily_status
  		else
  			render 'edit'
  		end
	end
	def show
		@daily_status=DailyStatus.find(params[:id])
		@project=Project.find(@daily_status.project_id)
	end
	def status_params
    	params.require(:daily_status).permit(:status_date, :project_name, :duration, :work_done, :project_id, :checked)
  	end
  	def verify_statuses
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
