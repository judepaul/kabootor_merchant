class User < ApplicationRecord
  # belongs_to :visitor
  # belongs_to :tenant
  has_one :user_session
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
         
         
  def populate_tenant(tenant_id)
    user = User.where(tenant_id: tenant_id).last
    unless user.blank?
      webrtc_server_info = WebrtcServerInfo.create_webrtc_server_info user
    end
  end 
end
