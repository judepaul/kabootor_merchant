class CreateCompanyInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :company_infos do |t|
      t.text :name
      t.text :phone
      t.text :address
      t.text :logo_file_name
      t.text :logo_file_path
      t.text :white_label_info_id

      t.timestamps
    end
  end
end
