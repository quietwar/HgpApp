class AddAdminUsersToAminUser < ActiveRecord::Migration[5.2]

    def change
      add_column :admin_users, :admin, :boolean
    end
  end
