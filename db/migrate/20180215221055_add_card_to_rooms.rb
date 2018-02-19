class AddCardToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :card, :string
  end
end
