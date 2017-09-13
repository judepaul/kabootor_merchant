class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    if resource.save
      visitor_id = params[:user][:visitor_id]
      # Visitor continue with signup after start exploring
      unless visitor_id.blank?
        resource.update_attribute("visitor_id", visitor_id)
        tenant = Tenant.create
        resource.populate_tenant tenant.id unless tenant.blank?
      end
    end
  end
  
  
  protected
  def after_sign_up_path_for(resource)
      sign_out resource
      new_user_session_path
  end
  

  def after_inactive_sign_up_path_for(resource)
    new_user_registration
  end
  
end