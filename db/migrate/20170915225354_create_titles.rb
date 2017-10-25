class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
      t.integer :artist_id
      t.string :j_title, limit: 50, null: false, :collation => "utf8_general_ci"
      t.string :e_title, limit: 50, null: false, :collation => "utf8_general_ci"
      t.decimal :srp, :precision => 5, :scale => 2
      t.timestamps null: false
    end
    add_index("titles", "artist_id")
  end

  def self.down
  	drop_table :titles
  end



end
