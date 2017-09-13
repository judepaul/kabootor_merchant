class CreateWebrtcServerInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :webrtc_server_infos do |t|
      t.references :tenant, foreign_key: true
      t.text :server_name
      t.text :session_id
      t.text :availability_status

      t.timestamps
    end
  end
end
