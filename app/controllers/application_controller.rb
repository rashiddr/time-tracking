class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :set_time_zone
  def set_time_zone(&block)
      if user_signed_in?
          time_zone = current_user.location.try(:time_zone) || 'UTC'
      else
          time_zone ='UTC'
      end
      Time.use_zone(time_zone, &block)
  end
  def is_admin
    if current_user.role != "Manager"
      session.clear
      flash[:warning]="You must sign in as admin"
      redirect_to '/users/sign_in', :notice => "Please sign in as admin "
    end
  end
  def after_inactive_sign_up_path_for(resource)
    flash[:warning]="You must confirm your mail first"
    new_user_session_path 
  end
  def complete_profile
    if !current_user.profile_completion?
      flash[:warning]="Please complete your profile"
      redirect_to edit_profile_path
    end
  end
  def save_location
    if !current_user.location.present?
      redirect_to user_location_set_location_path
    end
  end
  def after_sign_in_path_for(resource)
    if current_user.role == "Manager" 
      flash[:success]="Signed in as admin"
      admin_index_path
  	else
      flash[:success]="Signed in successfully"
      session.fetch 'user_return_to',root_path
	 end
  end
  protected
  def configure_permitted_parameters
    added_attrs = [:user_pic, :username, :email, :password, :password_confirmation, :place, :dob, :role, :first_name, :last_name,:remember_me,:confirmation_token]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
