class FixColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :cohorts, :user_id
    add_column :cohorts, :user_id, :bigint
  end
end
