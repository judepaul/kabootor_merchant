class AddVideoCreationChecksToVisitor < ActiveRecord::Migration[5.1]
  def change
    add_column :visitors, :is_create_video, :boolean
    add_column :visitors, :is_details, :boolean
    add_column :visitors, :is_scheduled, :boolean
  end
end
