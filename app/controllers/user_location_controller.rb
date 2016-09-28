class UserLocationController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin, only:[:index]
	def index
		@users=User.select_users_with_location()
	end
	def set_location
		@location=Location.new
	end
	def change_location
		@location=Location.find_or_create_by(user_id:current_user.id)
		respond_to do |format|
      		format.html
      		format.js
      	end
	end
	def update_location
		@location=Location.find_or_create_by(user_id:current_user.id)
		@location.time_zone=Timezone.lookup(params[:lat],params[:lng])
		if @location.update(place_id:params[:place_id], latitude:params[:lat], longitude:params[:lng],place_name:params[:place_name] ,user_id:current_user.id)
			flash[:success]="Location updated successfully"
			redirect_to root_path
		else
			render 'change_location'
		end
	end
	private
	def location_params
		params.permit(:place_id,:lat,:lng,:place_name)
	end
end
