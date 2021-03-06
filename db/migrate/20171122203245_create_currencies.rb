class CreateCurrencies < ActiveRecord::Migration

  def self.up
    create_table :currencies do |t|
      t.string :code
      t.timestamps null: false
    end
    change_column :currencies, :code, "VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end

  def self.down
  	drop_table :currencies
  end 



end
