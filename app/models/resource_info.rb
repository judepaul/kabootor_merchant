class ResourceInfo < ApplicationRecord
  belongs_to :tenant
  belongs_to :customer
  belongs_to :storage_provider
end
