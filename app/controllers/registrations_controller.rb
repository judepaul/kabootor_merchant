class RegistrationsController < Devise::RegistrationsController
  
  def create
    email = sign_up_params[:email]
    if User.exists?(email: email)
      flash[:error] = "User with same email already exists. Please try with another email address"
      redirect_to new_user_session_path
    else
      super
      # MyDeviseMailer.confirmation_instructions(resource, resource.confirmation_token, {}).deliver unless resource.invalid?
      if resource.save
        visitor_id = params[:user][:visitor_id]
        # Visitor continue with signup after start exploring
        unless visitor_id.blank?
          tenant = Tenant.create
          resource.update_column("tenant_id", tenant.id)
          resource.populate_tenant tenant.id unless tenant.blank?
        end
      end
    end
  end
  
  protected
  def after_sign_up_path_for(resource)
      sign_out resource
      new_user_session_path
  end
  

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
  
end