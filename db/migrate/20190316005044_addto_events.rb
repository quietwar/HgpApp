class AddtoEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :string
    add_reference :events, :admin_users
  end
end
