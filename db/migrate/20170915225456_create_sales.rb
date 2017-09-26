class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :artist_id
      t.integer :title_id
      t.string :first_name, limit: 90, null: false
      t.string :last_name, limit: 90, null: false
      t.string :email, limit: 50, null: false
      t.string :format, limit: 90, null: false
      t.decimal :price, :precision => 5, :scale => 2
      t.timestamps null: false
    end
    add_index :sales, ["artist_id", "title_id"]
  end

  def self.down
  	drop_table :sales
  end

end
