class UsersController < ApplicationController
	before_filter :authenticate_user!
	def list_users
		@user=User.all
	end
	def show
		@user=User.find(params[:id])
	end
end
