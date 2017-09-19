class Customer < ApplicationRecord
  belongs_to :tenant
  
  def self.create_customer user
    p "Inside create_customer"
    unless user.blank?
      customer = Customer.new
      customer.tenant_id = user.tenant_id
      customer.name = user.visitor.receiver_name unless user.visitor.blank?
      customer.email = user.visitor.receiver_email unless user.visitor.blank?
      customer.phone = user.visitor.receiver_phone unless user.visitor.blank?
      customer.save
      customer.id
    end
  end
  
end
