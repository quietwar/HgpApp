class ChangeTableUserInfo < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_infos, :full_name, :name
  end
end
