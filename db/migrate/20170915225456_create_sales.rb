class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :artist_id
      t.integer :title_id
      t.integer :order_number
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50, null: false
      t.string :email, limit: 90, null: false
      t.string :format, limit: 50, null: false
      t.decimal :price, :precision => 5, :scale => 2
      t.timestamps null: false
    end
    add_index :sales, ["artist_id", "title_id"]
    change_column :sales, :first_name, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :sales, :last_name, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :sales, :email, "VARCHAR(90) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :sales, :format, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end

  def self.down
  	drop_table :sales
  end

end
