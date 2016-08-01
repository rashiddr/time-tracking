class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def is_admin
    if current_user.role != "Manager"
      session.clear
      redirect_to '/users/sign_in', :notice => "Please sign in as admin "
    end
  end
  def after_sign_in_path_for(resource)
    if current_user.role == "Manager" 
      admin_index_path
  	else
      session.fetch 'user_return_to',root_path
	end
  end
  protected
  def configure_permitted_parameters
    added_attrs = [:user_pic, :username, :email, :password, :password_confirmation, :place, :dob, :role, :first_name, :last_name,:remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
