class ResourceInfo < ApplicationRecord
  belongs_to :tenant
  belongs_to :customer
  belongs_to :storage_provider
  
  def self.create_resource_info user, customer_id, storage_provider_id
    p "Inside create_resource_info"
    unless user.blank?
      resource = ResourceInfo.new
      resource.tenant_id = user.tenant_id
      resource.customer_id = customer_id unless customer_id.blank?
      resource.storage_provider_id = storage_provider_id unless storage_provider_id.blank?
      resource.resource_type = user.visitor.resource_type unless user.visitor.blank?
      resource.availability_status = user.visitor.resource_availability_status unless user.visitor.blank?
      resource.resource_uri = user.visitor.resource_uri unless user.visitor.blank?
      resource.resource_size = user.visitor.resource_size unless user.visitor.blank?
      resource.resource_length = user.visitor.resource_length unless user.visitor.blank?
      resource.save
    end
  end
  
end
