class AdminController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin
	def index
		
	end
	def admin_panel
		if(!params[:user].blank?)
			User.where(id: params[:user][:ids]).update_all(role: 0)
		end
		@user=User.where(role: 0)
	end
end
