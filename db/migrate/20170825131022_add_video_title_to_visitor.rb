class AddVideoTitleToVisitor < ActiveRecord::Migration[5.1]
  def change
    add_column :visitors, :video_title, :text
  end
end
