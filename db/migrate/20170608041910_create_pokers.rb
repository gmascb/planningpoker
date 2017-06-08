class CreatePokers < ActiveRecord::Migration
  def change
    create_table :pokers do |t|
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end
