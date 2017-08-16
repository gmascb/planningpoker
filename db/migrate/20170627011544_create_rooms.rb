class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :players
      
      t.timestamps null: false
    end
  end
end
