class VideoController < ApplicationController
  include Image_data_utils
  skip_before_action :verify_authenticity_token, :only =>[:poster_image, :visitor_video_details]
  
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
    params.permit(:utf8, :authenticity_token, :page_type, :session_id, :video_name, :customer_type, :customer_name, :customer_email, :customer_phone)
    visitor = Visitor.where(media_server_session_id: params[:session_id]).last unless params[:session_id].blank?
    if visitor.update_attributes(video_title: params[:video_name], receiver_name: params[:customer_name], receiver_email: params[:customer_email], receiver_phone: params[:customer_phone])
    render json:
      {
        session_id: params[:session_id],
        video_name: params[:video_name], 
        customer_name: params[:customer_name], 
        customer_email: params[:customer_email], 
        customer_phone: params[:customer_phone],
        video_details_status: "saved"
      }.to_json
    else
      render json:
        {
          video_details_status: "not saved"
        }.to_json
    end
  end
  
end
