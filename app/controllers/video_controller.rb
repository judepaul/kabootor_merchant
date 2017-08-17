class VideoController < ApplicationController
  include Image_data_utils
  skip_before_action :verify_authenticity_token, :only =>[:poster_image]
  
  def index
    @file_name = "/photos/#{params[:file_name]}.png"
  end
  
  def poster_image
    file_name = convert_image_data_uri_to_image(params[:img_data], params[:archival_id]) if !params[:img_data].blank?
    respond_to do |format|
      format.html { redirect_to video_index_path(:file_name => file_name) } 
    end
  end
  
  
end
