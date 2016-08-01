class AdminPanelsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin
	def index
		if(!params[:user].blank?)
			User.where(id: params[:user][:ids]).update_all(role: 0)
		end
		@user=User.where(role: 0)
	end
end
