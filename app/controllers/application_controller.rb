class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    sign_in_object = resource.class.name
  #  binding.pry
    if sign_in_object === "User"
      user_path(resource)
    else
      organization_path(resource)
    end
  end
end
