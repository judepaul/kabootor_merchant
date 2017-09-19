class User < ApplicationRecord
  belongs_to :visitor
  # belongs_to :tenant
  has_one :user_session
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
         
  def populate_tenant tenant_id
    user = User.where(tenant_id: tenant_id).last
    unless user.blank?
      webrtc_server_info = WebrtcServerInfo.create_webrtc_server_info user
      storage_provider_id = StorageProvider.create_storage_provider user
      customer_id = Customer.create_customer user
      resource = ResourceInfo.create_resource_info user, customer_id, storage_provider_id
    end
  end 
end
