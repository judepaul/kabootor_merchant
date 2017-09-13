class CreateResourceInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_infos do |t|
      t.references :tenant, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :storage_provider, foreign_key: true
      t.text :resource_type
      t.text :availability_status
      t.text :resource_uri
      t.integer :resource_size
      t.integer :resource_length

      t.timestamps
    end
  end
end
