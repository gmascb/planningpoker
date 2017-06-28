class CreatePokers < ActiveRecord::Migration
  def change
    create_table :pokers do |t|
      t.string :name
      t.decimal :value
      t.string :user
      t.decimal :room
      
      t.timestamps null: false
    end
  end
end
