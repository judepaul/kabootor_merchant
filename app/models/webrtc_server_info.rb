class WebrtcServerInfo < ApplicationRecord
  belongs_to :tenant
  
  def self.create_webrtc_server_info user
    p "Inside create_webrtc_server_info"
    unless user.blank?
      webrtc_server_info = WebrtcServerInfo.new
      webrtc_server_info.tenant_id = user.tenant_id
      webrtc_server_info.server_name = user.visitor.media_server_name unless user.visitor.blank?
      webrtc_server_info.session_id = user.visitor.media_server_session_id unless user.visitor.blank?
      webrtc_server_info.availability_status = user.visitor.availability_status unless user.visitor.blank?
      webrtc_server_info.save
    end
  end
  
end
