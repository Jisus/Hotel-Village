class SessionsController < Devise::SessionsController
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "admin"
    else
      "login"
    end
  end
end
