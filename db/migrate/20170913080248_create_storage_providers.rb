class CreateStorageProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :storage_providers do |t|
      t.references :tenant, foreign_key: true
      t.text :name
      t.text :archive_id
      t.text :status

      t.timestamps
    end
  end
end
