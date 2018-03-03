class RemoveIndexTouser < ActiveRecord::Migration[5.1]
  def change
    remove_index :admin_users, :email
  end
end
