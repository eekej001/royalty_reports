class CreatePayees < ActiveRecord::Migration
  
 def self.up
    create_table :payees do |t|
      t.string :email
      t.decimal :balance, :precision => 5, :scale => 2, 
      t.integer :currency_id
      t.timestamps null: false
    end
    change_column :payees, :email, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end

  def self.down
  	drop_table :payees
  end


end
