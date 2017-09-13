class Tenant < ApplicationRecord
  has_one :company_info
  has_one :user
  has_many :customers
  has_many :storage_providers
  has_many :resource_infos  
 end
