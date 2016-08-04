class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin, :except => ["latest_projects"]
	
	def index
		@project=Project.all
		render layout: "admin_layout"
	end
	def new 
		
		@project=Project.new
		render layout: "admin_layout"
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
		render layout: "admin_layout"		
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
		render layout: "admin_layout"
	end
	def destroy
		@project=Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end
	def latest_projects
		@projects=Project.order("created_at DESC").limit(12)
	end
	
	private
  	def project_params
    	params.require(:project).permit(:project_name, :client, :description)
  	end
end
