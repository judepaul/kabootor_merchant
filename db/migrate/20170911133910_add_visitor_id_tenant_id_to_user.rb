class AddVisitorIdTenantIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :visitor, foreign_key: true
    add_column :users, :tenant_id, :string
    add_column :users, :role, :string
  end
end
