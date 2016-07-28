class DailyStatusesController < ApplicationController
	def index
		@daily_status=DailyStatus.includes(:project).where(user_id: current_user.id).all
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
end
