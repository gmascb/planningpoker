class AddUserToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :user, :string
  end
end
