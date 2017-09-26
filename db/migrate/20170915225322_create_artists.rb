class CreateArtists < ActiveRecord::Migration
  
  def self.up
    create_table :artists do |t|
      t.string :e_name, limit: 50, null: false
      t.string :j_name, limit: 50, null: false
      t.string :email, limit: 50, null: false
      t.timestamps null: false
    end
  end


  def self.down
  	drop_table :artists
  end




end
