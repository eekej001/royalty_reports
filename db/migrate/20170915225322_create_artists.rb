class CreateArtists < ActiveRecord::Migration
  
  def self.up
    create_table :artists do |t|
      t.string :e_name, limit: 50, null: false
      t.string :j_name, limit: 50, null: false
      t.string :email, limit: 90, null: false
      t.integer :percent
      t.integer :r_frequency
      t.integer :p_frequency
      t.decimal :pending, :precision => 5, :scale => 2, :default => 0
      t.timestamps null: false    
    end
    change_column :artists, :e_name, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :artists, :j_name, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :artists, :email, "VARCHAR(90) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end


  def self.down
  	drop_table :artists
  end




end
