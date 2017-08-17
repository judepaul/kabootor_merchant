class VideoController < ApplicationController
  include Image_data_utils
  skip_before_action :verify_authenticity_token, :only =>[:poster_image]
  
  def index
    p "@@@@@@@ ==> #{params[:file_name]}"
    @file_name = params[:file_name]
  end
  
  def poster_image
    file_name = convert_image_data_uri_to_image(params[:img_data], params[:archival_id]) if !params[:img_data].blank?
    file_name = "photo_9b44cfa0-8578-40d7-8665-40ec3011e3d0"
    respond_to do |format|
      p "!!!!!!!"
      format.html { redirect_to video_index_path(:file_name => file_name) } 
    end
  end
  
  
end
