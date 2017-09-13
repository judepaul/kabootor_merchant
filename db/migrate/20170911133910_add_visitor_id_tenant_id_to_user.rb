class AddVisitorIdTenantIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :visitor, foreign_key: true
    add_reference :users, :tenant, foreign_key: true
    add_column :users, :role, :text
  end
end
