class BirthdaysController < ApplicationController
	
	def index
		@user_birthday_today=User.dob_today
		@user_birthday_tomorrow=User.find_dobs_for(Date.today + 1.days)
		@user_birthday_recent=User.find_dobs_for(Date.today + 2.days, Date.today + 15.days)
	end
end
