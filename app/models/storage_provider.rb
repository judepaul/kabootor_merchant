class StorageProvider < ApplicationRecord
  belongs_to :tenant
  
  def self.create_storage_provider user
    p "Inside create_storage_provider"
    unless user.blank?
      storage_provider = StorageProvider.new
      storage_provider.tenant_id = user.tenant_id
      storage_provider.name = user.visitor.storage_provider_name unless user.visitor.blank?
      storage_provider.archive_id = user.visitor.storage_provider_resource_id unless user.visitor.blank?
      storage_provider.status = user.visitor.storage_provider_status unless user.visitor.blank?
      storage_provider.save
      storage_provider.id
    end
  end
  
end
