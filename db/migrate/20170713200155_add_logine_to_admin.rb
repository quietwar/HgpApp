class AddLogineToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :login, :string
  end
end
