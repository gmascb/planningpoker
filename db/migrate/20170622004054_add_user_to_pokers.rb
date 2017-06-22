class AddUserToPokers < ActiveRecord::Migration
  def change
    add_column :pokers, :user, :string
  end
end
