class UsersController < ApplicationController
	before_filter :authenticate_user!
	def list_users
		@user=User.all
	end
	def show
		@user=User.find(params[:id])
	end
	def new_joiners
		@new_join=User.order("join_date DESC").limit(12)
	end
	def birthdays
		@user_birthday_today=User.dob_today
		@user_birthday_tomorrow=User.find_dobs_for(Date.today + 1.days)
		@user_birthday_recent=User.find_dobs_for(Date.today + 2.days, Date.today + 15.days)
	end
end
