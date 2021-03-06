class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
      t.integer :artist_id
      t.string :j_title, limit: 50, null: false
      t.string :e_title, limit: 50, null: false
      t.decimal :srp, :precision => 5, :scale => 2
      t.integer :populated, :default => 0
      t.timestamps null: false
    end
    add_index("titles", "artist_id")
    change_column :titles, :j_title, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :titles, :e_title, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end

  def self.down
  	drop_table :titles
  end



end
