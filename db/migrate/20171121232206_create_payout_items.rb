class CreatePayoutItems < ActiveRecord::Migration
  def self.up
    create_table :payout_items do |t|
      t.string :transaction_id
      t.string :transaction_status
      t.decimal :amount, :default => 0.0, null: false
      t.decimal :fees, :default => 0.0, null: false
      t.string :note
      t.string :sender_item_id
      t.datetime :time_processed
      t.integer :payout_batch_id
      t.integer :currency_id
      t.integer :payee_id
      t.timestamps null: false
      t.string :paypal_id
      t.string :error
    end
    change_column :payout_items, :transaction_id, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_items, :transaction_status, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_items, :note, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_items, :sender_item_id, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_items, :paypal_id, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_items, :error, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end

  def self.down
  	drop_table :payout_items
  end   	
end
