class VideoController < ApplicationController
  include Image_data_utils
  skip_before_action :verify_authenticity_token, :only =>[:poster_image]
  
  def index
  end
  
  def poster_image
    p "!!!!!!!!!!!"
    file_name = convert_image_data_uri_to_image(params[:img_data], params[:archival_id]) if !params[:img_data].blank?
    p params[:archival_id]
    p file_name
    respond_to do |format|
          format.html {redirect_to("/video/index")}
    end
  end
  
  
end
