class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@project=Project.all
	end
	def new 
		@project=Project.new
	end
	def create
		@project = Project.new(project_params)
 		if(@project.save)
  			redirect_to @project
  		else
  			render 'new'
  		end
  	end
	def edit
		@project= Project.find(params[:id])
				
	end
	def update
		@project= Project.find(params[:id])
		if(@project.update(project_params))
  			redirect_to @project
  		else
  			render 'edit'
  		end
	end
	def show
		@project=Project.find(params[:id])
	end
	def destroy
		@project=Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end
	private
  	def project_params
    	params.require(:project).permit(:project_name, :client, :description)
  	end
end
