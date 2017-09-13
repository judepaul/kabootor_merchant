class CreateTransactionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_details do |t|
      t.references :tenant, foreign_key: true
      t.integer :sender_id
      t.text :sender_email
      t.integer :receiver_id
      t.text :receiver_email
      t.datetime :txn_date

      t.timestamps
    end
  end
end
