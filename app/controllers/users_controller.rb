class UsersController < ApplicationController
	def list_users
		@user=User.all
	end
end
