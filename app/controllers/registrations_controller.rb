class RegistrationsController < Devise::RegistrationsController

def set_param
    params[:user].permit(:profilepicture)
end

def update_resource(resource, set_param)
    resource.update_without_password(set_param)
end
end
