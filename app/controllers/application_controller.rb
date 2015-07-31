class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :profilepicture) }
  end

  after_filter :store_location

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  # def after_sign_in_path_for(resource)
  #   session[:previous_url] || root_path
  # end

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin == true
      admin_path
    else
      session[:previous_url]
    end
  end

end
