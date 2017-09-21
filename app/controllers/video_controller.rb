class VideoController < ApplicationController
  include ImageDataUtils
  skip_before_action :verify_authenticity_token, :only =>[:poster_image, :visitor_video_details]
  
  def index
    if params[:visitor_id].blank?
      
    else
      @visitor = Visitor.find(params[:visitor_id])
    end
  end
  
  def poster_image
     visitor = Visitor.where(media_server_session_id: params[:session_id]).last unless params[:session_id].blank?
     unless params[:img_data].blank? && params[:archival_id].blank?
       poster_image_file = convert_image_data_uri_to_image(USER_TYPE_VISITOR, params[:img_data], params[:archive_id])
       visitor.poster_image_filename = poster_image_file
       visitor.poster_image_location = POSTER_IMAGE_VISITOR_DIRECTORY
       visitor.poster_image_status = POSTER_IMAGE_STATUS
       visitor.save
     end
     if !visitor.blank? && !visitor.resource_uri.blank?
       render json:
         {
           image_status: visitor.poster_image_status
         }
     else
       render json:
         {
           image_status: "not_created"
         }.to_json
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
    if visitor.update_attributes(video_title: params[:video_name], receiver_name: params[:customer_name], receiver_email: params[:customer_email], receiver_phone: params[:customer_phone], is_details: true)
    render json:
      {
        visitor_id: visitor.id,
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
