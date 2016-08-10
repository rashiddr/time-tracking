class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin

	def index
		@user=current_user
	  	@projects=Project.latest_projects
	  	@new_join=User.new_joiners
	  	@training=Training.latest_training
		@user_birthday_recent=User.birthday_ordered_asc
	end
	def admin_panel #to manage admin panels
	
		if(!params[:user].blank?)
			User.add_admins(params[:user][:ids])    
		end
		@user=User.list_admins
	end
end
