class AddPlayersNameToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :playersname, :string
  end
end
