class UsersController < ApplicationController
	before_action :authenticate_user!
	def list_users
		if(!params[:user_id].blank?)#Employe name selected
			@user=User.select_user(params[:user_id]).paginate(page:params[:page], per_page:12)
		elsif(!params[:project_id].blank?&&!params[:employe_name].blank?)#project selected and name not fully entered 
			@project=Project.find(params[:project_id])
			@user=@project.users.search_users(params[:employe_name]).paginate(page:params[:page], per_page:12)
		elsif(!params[:project_id].blank?)#only project selected
			@project=Project.find(params[:project_id])
			@user=@project.users.paginate(page:params[:page], per_page:12)
		elsif(!params[:employe_name].blank?)#no project selected and partial name entered
			@user=User.search_users(params[:employe_name]).paginate(page:params[:page], per_page:12)
		else#both fields blank
			@user=User.users_list.paginate(page:params[:page], per_page:12)
		end
	end
	def show
		@user=User.find(params[:id])
		respond_to do |format|
      		format.html
      		format.js
      	end
	end
	def new_joiners
		@new_join=User.new_joiners
	end
	def birthdays
		@user_birthday_recent=User.birthday_ordered_asc
	end
	def edit_profile
		@user=current_user
	end
	def update_profile
		@user=User.find(current_user.id)
		if(@user.update(user_params))
			flash[:success] = "Profile edited successfully"
  			redirect_to root_path
  		else
  			flash.now[:error] = "Unable to update profile"
  			render 'edit_profile'
  		end
	end
	def auto_complete_users
		@user=User.search_users(params[:term])
		respond_to do |format|  
    		format.html
    		format.json { render json: @user.map{|x| {label:"#{x.first_name} #{x.last_name}",value:x.id } } }
    	end
	end
	def change_logo
		@user=User.find(current_user.id)
	end
	def update_logo
		@user=User.find(current_user.id)
		if params[:user].present?
			if(@user.update(user_params))
				flash[:success] = "logo edited successfully"
	  			redirect_to root_path
	  		else
	  			flash.now[:error] = "Unable to update logo"
	  			render 'change_logo'
	  		end
	  	else
	  		redirect_to root_path
	  	end
	end
	private
	def user_params
    	params.require(:user).permit(:user_pic,:logo,:first_name, :last_name, :place, :dob, :username, :email, :project_id)
  	end 
end
