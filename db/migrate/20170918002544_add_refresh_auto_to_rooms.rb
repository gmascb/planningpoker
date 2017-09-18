class AddRefreshAutoToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :refreshauto, :boolean
  end
end
