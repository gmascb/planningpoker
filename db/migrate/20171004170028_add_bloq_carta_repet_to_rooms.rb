class AddBloqCartaRepetToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :bloqcartarepet, :boolean
  end
end
