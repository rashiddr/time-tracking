class DailyStatusesController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin, :only => [:verify_statuses]
	def index
		@daily_status=DailyStatus.previous_statuses(current_user.id).paginate(page:params[:page], per_page:5)	
	end
	def new
		@daily_status=  DailyStatus.new()
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
  	def verify_statuses #manager to view daily status of all employe
  		if(params[:search_date].blank? && params[:user].blank?)
			@daily_status=DailyStatus.previous_day_statuses
		elsif(params[:search_date].blank?)
			@daily_status=DailyStatus.employe_wise_statuses(params[:user][:user_id])	
		elsif(params[:user][:user_id].blank?)
			@daily_status=DailyStatus.date_wise_statuses(params[:search_date])
		else
			@daily_status=DailyStatus.status_of_user_at(params[:search_date],params[:user][:user_id])
		end 
  	end
end
