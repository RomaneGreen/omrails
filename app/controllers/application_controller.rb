class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
end
  def access_denied(exception)
  redirect_to root_path, alert: exception.message
  end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name])
 end

end
