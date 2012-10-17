class AddGroupLeaderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_leader, :boolean, default: false, null: false
  end
end
