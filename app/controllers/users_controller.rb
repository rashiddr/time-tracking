class UsersController < ApplicationController
	before_action :authenticate_user!
	def list_users
		@user=User.all
	end
	def show
		@user=User.find(params[:id])
	end
	def new_joiners
		@new_join=User.new_joiners
	end
	def birthdays
		@user_birthday_recent=User.birthday_ordered_asc
	end
end
