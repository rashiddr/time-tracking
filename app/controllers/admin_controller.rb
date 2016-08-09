class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin

	def index
		@user=current_user
	  	@projects=Project.order("created_at DESC").limit(12)
	  	@new_join=User.order("join_date DESC").limit(12)
	  	@training=Training.where(training_date: Date.today..Date.today + 30.days)
	  	@user_birthday_today=User.dob_today
		@user_birthday_tomorrow=User.find_dobs_for(Date.today + 1.days)
		@user_birthday_recent=User.find_dobs_for(Date.today + 2.days, Date.today + 15.days)
	end
	def admin_panel #to manage admin panels
	
		if(!params[:user].blank?)
			User.where(id: params[:user][:ids]).update_all(role: 0)
		end
		@user=User.where(role: 0)
	end
end
