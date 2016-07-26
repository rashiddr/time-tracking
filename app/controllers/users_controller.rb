class UsersController < ApplicationController
	def list_users
		@user=User.all
	end
	def show
		@user=User.find(params[:id])
	end
end
