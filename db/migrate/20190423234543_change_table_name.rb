class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :cohorts_users, :cohort_users
  end
end
