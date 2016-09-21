class RegistrationsController < Devise::RegistrationsController
  def after_inactive_sign_up_path_for(resource)
     new_user_session_path
  end
  def after_sign_up_path_for(resource)
  	User.profile_completed(current_user)
  	root_path
  end
end
