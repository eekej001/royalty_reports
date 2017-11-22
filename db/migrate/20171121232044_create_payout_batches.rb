class CreatePayoutBatches < ActiveRecord::Migration
 
 def self.up
    create_table :payout_batches do |t|
      t.string :status
      t.string :sender_batch_id
      t.string :email_subject
      t.decimal :amount, :default => 0.0, null: false
      t.integer :currency_id
      t.decimal :fees, :default => 0.0, null: false
      t.timestamps null: false
      t.string :paypal_id
    end
    change_column :payout_batches, :status, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_batches, :sender_batch_id, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_batches, :email_subject, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :payout_batches, :payoal_id, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end

  def self.down
  	drop_table :payout_batches
  end   	

end
