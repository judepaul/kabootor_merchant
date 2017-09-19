class ConfirmationsController < Devise::RegistrationsController
  
  def show
    if params[:confirmation_token].present?
      @original_token = params[:confirmation_token]
    elsif params[resource_name].try(:[], :confirmation_token).present?
      @original_token = params[resource_name][:confirmation_token]
    end

    self.resource = resource_class.find_by_confirmation_token @original_token
    yield resource if block_given?
    if !resource.nil? && resource.errors.empty?
      self.resource.update_attribute("confirmed_at", Time.now.utc)
      flash[:notice] = "Your email address has been successfully confirmed. Login to start using Kabootor services"
      redirect_to new_user_session_path
    else
      flash[:alert] = 'Invalid confirmation token'
      redirect_to root_path
    end

  end

  
  private
    def after_confirmation_path_for(resource_name, resource)
      new_user_session_path
    end
end
