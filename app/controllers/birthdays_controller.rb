class BirthdaysController < ApplicationController
	def index
		@user=User.where('extract(month from dob) = ?', Date.today.strftime("%m"), 'extract(day from dob) = ?', Date.today.strftime("%d")).all
	end
end
