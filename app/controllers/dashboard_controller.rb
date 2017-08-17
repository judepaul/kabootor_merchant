class DashboardController < ApplicationController
  include OpentokUtils
  before_action :init_recording, only: [:start_exploring]
  
  def index
  end

  def start_exploring
    # @recordings = Recording.all
    unless mobile_device?
        @session_new = create_opentok_session
        if !@session_new.blank?
          @token = @opentok.generate_token(@session_new.session_id, :role => :moderator)
          @counter_time = Rails.application.config.counter_time
        else
          flash[:alert] = "Unable to connect to video session. Try again..!"
          redirect_to root_path
        end
    end
  end

end


private

def init_recording
  @opentok = init_opentok
  @api_key = api_key
end
