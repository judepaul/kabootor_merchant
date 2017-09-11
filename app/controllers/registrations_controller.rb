class RegistrationsController < Devise::RegistrationsController
  
  def create
    p "%%%%%%%%%%%%%"
    super
    p "@@@@@@@@@@@@"
    if resource.save
      p "!!!!!!!!!"
      resource.update_attributes(visitor_id: params[:user][:visitor_id]) unless params[:user][:visitor_id].blank?
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