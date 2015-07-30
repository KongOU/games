class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def configure_permitted_parameters

      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :profilepicture) }
  end

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin == true
      admin_path
    else
      root_path
    end
  end
end
