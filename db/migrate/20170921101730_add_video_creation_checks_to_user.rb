class AddVideoCreationChecksToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_create_video, :boolean
    add_column :users, :is_details, :boolean
    add_column :users, :is_scheduled, :boolean
  end
end
