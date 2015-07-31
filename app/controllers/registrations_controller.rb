class RegistrationsController < Devise::RegistrationsController

  def set_params
    params[:user].permit(:profilepicture)
  end
  protected
  def update_resource(resource, set_params)
    resource.update_without_password(set_params)
  end

end
