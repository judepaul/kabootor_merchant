class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.references :company_info
      t.text :industry_name

      t.timestamps
    end
  end
end
