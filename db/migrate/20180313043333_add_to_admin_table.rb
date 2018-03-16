class AddToAdminTable < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :city, :string
  end
end
