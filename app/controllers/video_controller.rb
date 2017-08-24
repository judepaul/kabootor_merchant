class VideoController < ApplicationController
  include Image_data_utils
  skip_before_action :verify_authenticity_token, :only =>[:poster_image]
  
  def index
    @file_name = params[:media_id]
    @visitor = Visitor.where(storage_provider_resource_id: params[:media_id]).last unless params[:media_id].blank?
  end
  
  def poster_image
    file_name = convert_image_data_uri_to_image(params[:img_data], params[:archival_id]) if !params[:img_data].blank?
    # file_name = "photo_9b44cfa0-8578-40d7-8665-40ec3011e3d0.png"
    respond_to do |format|
      format.html { redirect_to video_index_path(:media_id => file_name, format: :html) } 
    end
  end
  
  def visitor_new_customer
    # params.require(:video).permit(:name)
    params.permit(:utf8, :authenticity_token, :media, :page_type, :name, :email, :phone)
    p params
    redirect_to customers_path(media: params[:media])
  end
  
  def visitor_video_details
    p "!!!!!!!!!!!!!!!!"
    render json:
      {
        video_details_status: "saved"
      }.to_json
  end
  
end
