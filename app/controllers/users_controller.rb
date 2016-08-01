class UsersController < ApplicationController
	before_filter :authenticate_user!
	def list_users
		@user=User.all
	end
	def show
		@user=User.find(params[:id])
	end
	def new_joiners
		@user=User.order("join_date DESC").limit(12)
	end
end
