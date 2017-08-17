require "opentok"

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
    archive = Archive.where(:archival_id => params[:archive_id]).last
    if !archive.blank?
    render json: 
    {
      video_url: archive.archival_url,
      video_status: archive.archival_status
      }.to_json
    else
      render json: 
      {
        video_status: "not_uploaded"
        }.to_json
    end
    
  end
  
  private

  def init_recording
    @opentok = init_opentok
    @api_key = api_key
  end
  
  
end
