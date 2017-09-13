class CreateUserSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_sessions do |t|
      t.references :user, foreign_key: true
      t.text :browser_name
      t.text :browser_version
      t.text :js_info
      t.text :os_name
      t.text :os_version

      t.timestamps
    end
  end
end
