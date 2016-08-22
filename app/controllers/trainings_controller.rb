class TrainingsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin, except: [:list_training]
	def index
		@training=Training.order("created_at DESC")
	end
	def new
		@training=Training.new()
	end
	def create
		@training = Training.new(training_params)
 		if(@training.save)
  			redirect_to @training
  		else
  			render 'new'
  		end
  	end
	def edit
		@training= Training.find(params[:id])	
	end
	def update
		@training= Training.find(params[:id])
		if(@training.update(training_params))
  			redirect_to @training
  		else
  			render 'edit'
  		end
	end
	def show
		@training=Training.find(params[:id])
	end
	def destroy
		@training=Training.find(params[:id])
		@training.destroy
		respond_to do |format|
      		format.html { redirect_to trainings_path }
      		format.js   { render :layout => false }
   		end		
	end
	def list_training #list latest trainings
		@training=Training.latest_training
	end
	private
  	def training_params
    	params.require(:training).permit(:title, :trainer, :training_date ,:location)
  	end
end
