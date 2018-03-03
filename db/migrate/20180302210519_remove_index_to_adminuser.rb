class RemoveIndexToAdminuser < ActiveRecord::Migration[5.1]
    def change
      add_column :admin_users, :login, :string
    end

    def down
      remove_index :admin_users, :email, :index_admin_users_on_email
    end
end
