class AddApiToPoker < ActiveRecord::Migration[6.0]
  def change
    add_column :pokers, :api, :boolean, default: false
  end
end
