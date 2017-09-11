class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def mobile_device?
    if UserAgent.parse(request.env["HTTP_USER_AGENT"]).mobile?
      true
    else
      false
    end
  end

  helper_method :mobile_device?
  
  
  protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :visitor_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
  def after_sign_in_path_for(resource_or_scope)
   current_user
   "/dashboard/index"
  end
  
end
