class HomeController < ApplicationController
	  before_filter :authenticate_user!
	  #&format=json&callback=
	  def index
	  	if current_user.role == "Manager"
      		redirect_to '/admin'
    	end
	  	@user=current_user
	  	@projects=Project.order("created_at DESC").limit(12)
	  	@new_join=User.order("join_date DESC").limit(12)
	  	@training=Training.where(training_date: Date.today..Date.today + 30.days)
	  	@user_birthday_today=User.dob_today
		@user_birthday_tomorrow=User.find_dobs_for(Date.today + 1.days)
		@user_birthday_recent=User.find_dobs_for(Date.today + 2.days, Date.today + 15.days)
	  end
end
