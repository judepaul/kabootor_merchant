class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.references :tenant, foreign_key: true
      t.text :name
      t.text :email
      t.text :phone

      t.timestamps
    end
  end
end
