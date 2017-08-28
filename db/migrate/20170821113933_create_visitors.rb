class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.text :temp_tenant_id
      t.text :media_server_session_id
      t.text :media_server_name
      t.text :media_server_project_id
      t.text :availability_status
      t.text :storage_provider_resource_id
      t.text :storage_provider_access_key_id
      t.text :storage_provider_access_signature
      t.text :storage_provider_name
      t.text :storage_provider_status
      t.text :resource_type
      t.text :resource_availability_status
      t.text :resource_uri
      t.integer :resource_size
      t.integer :resource_length
      t.text :sender_email
      t.text :industry_name
      t.text :receiver_name
      t.text :receiver_email
      t.text :receiver_phone
      t.text :poster_image_filename
      t.text :poster_image_location
      t.text :poster_image_status
      t.boolean :is_abondon
      t.text :browser_name
      t.text :browser_version
      t.text :js_info
      t.text :os_name
      t.text :os_version

      t.timestamps
    end
  end
end
