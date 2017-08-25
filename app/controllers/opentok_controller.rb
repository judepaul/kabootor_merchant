require "opentok"
require "uri"

class OpentokController < ApplicationController
  include OpentokUtils
  before_action :init_recording, only: [:start, :stop, :upload_response]
  skip_before_action :verify_authenticity_token, :only =>[:start, :stop, :upload_response]
  
  def start
    archive = @opentok.archives.create params[:session_id], {
      :name => "Sc1 Video Recording",
      :output_mode => "composed",
      :has_audio => true,
      :has_video => true
    }
    p archive
    render json: archive.to_json
  end

  def stop
    p params[:archive_id]
    archive = @opentok.archives.stop_by_id(params[:archive_id])
    render json: {video_url: "https://s3.amazonaws.com/kabootor-tokbox/#{@api_key}/#{archive.id}/archive.mp4" }.to_json
  end
  
  def upload_response
    puts "The tokbox responded..! => #{params}"
    unless params.blank?
      visitor = Visitor.where(media_server_session_id: params[:sessionId]).first_or_create
      visitor.temp_tenant_id = generate_random_number
      visitor.media_server_session_id = params[:sessionId]
      visitor.storage_provider_resource_id = params[:id] # Archive ID
      url_params = extract_url_params(params[:url]) unless params[:url].blank?
      visitor.storage_provider_access_key_id = url_params[:AWSAccessKeyId] unless url_params.blank?
      visitor.media_server_name = Rails.application.secrets.MEDIA_SERVER_NAME
      visitor.media_server_project_id = params[:projectId]
      visitor.availability_status = AVAILABILITY_STATUS
      visitor.storage_provider_name = Rails.application.secrets.STORAGE_PROVIDER_NAME
      visitor.storage_provider_status = PROVIDER_STATUS
      visitor.storage_provider_access_key_id
      visitor.storage_provider_access_signature
      visitor.resource_type = RESOURCE_TYPE
      visitor.resource_availability_status = params[:status]
      visitor.resource_uri = params[:url].gsub(/\?.*/, '') unless params[:url].blank?
      visitor.resource_size = params[:size]
      visitor.resource_length = params[:duration]
      visitor.save
    end
    
    # archive = Archive.where(:archival_id => params[:id]).last
    # archive_status = params[:status]
    #
    # if archive.blank?
    #   archive = Archive.new
    #   archive.archival_id = params[:id]
    #   archive.archival_status = archive_status
    #   archive.save!
    # else
    #   archive.archival_status = archive_status
    #   puts "the size of the video is #{params[:size]}"
    #   puts "the duration of the video is #{params[:duration]}"
    #   archive.video_file_size = params[:size]
    #   archive.video_file_length = params[:duration]
    #   if archive_status == "uploaded"
    #     archive.archival_url = "https://s3.amazonaws.com/kabootor-tokbox/#{params[:partnerId]}/#{params[:id]}/archive.mp4"
    #   end
    #   archive.save!
    # end
    render json: 
    {
      video_status: "uploaded"
      }.to_json
  end
  
  def check_upload_url_status
    visitor = Visitor.where(storage_provider_resource_id: params[:archive_id]).last
    p "!!!!!!!!!!"
    p visitor
    if !visitor.blank? && !visitor.resource_uri.blank?
      render json:
        {
          media_session: visitor.media_server_session_id,
          video_url: visitor.resource_uri,
          video_status: visitor.storage_provider_status
        }
    else
      render json:
        {
          video_status: "not_uploaded"
        }.to_json
    end
    # archive = Archive.where(:archival_id => params[:archive_id]).last
    # if !archive.blank?
    # render json:
    # {
    #   video_url: archive.archival_url,
    #   video_status: archive.archival_status
    #   }.to_json
    # else
    #   render json:
    #   {
    #     video_status: "not_uploaded"
    #     }.to_json
    # end
    
  end
  
  private

  def init_recording
    @opentok = init_opentok
    @api_key = api_key
  end
  
  def generate_random_number
    SecureRandom.uuid.gsub("-", "")
  end
  
  def extract_url_params url
    # url = "http://www.example.com/something?param1=value1&param2=value2&param3=value3"
    uri = URI(url)
    url_params = URI::decode_www_form(uri.query).to_h
  end
  
  
end
