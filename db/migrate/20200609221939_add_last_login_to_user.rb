class AddLastLoginToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_login, :datetime, default: DateTime.now
  end
end
