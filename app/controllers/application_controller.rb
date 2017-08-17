class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def mobile_device?
    if UserAgent.parse(request.env["HTTP_USER_AGENT"]).mobile?
      true
    else
      false
    end
  end

  helper_method :mobile_device?
  
end
