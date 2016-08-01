class TrainingsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin
	def index
		@training=Training.all
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
		redirect_to trainings_path
	end
	private
  	def training_params
    	params.require(:training).permit(:title, :trainer, :training_date ,:location)
  	end
end
