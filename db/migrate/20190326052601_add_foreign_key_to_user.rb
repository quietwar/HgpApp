class AddForeignKeyToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :attendances, :user_id, :string
    remove_column :attendances, :attendance_id, :string
    remove_column :attendances, :cohort_id, :string
    add_column :attendances, :user_id, :bigint
    add_column :attendances, :cohort_id, :bigint
    add_column :attendances, :attendance_id, :bigint
    add_foreign_key :users, :cohorts
    add_foreign_key :users, :classrooms
    add_foreign_key :projects, :users
    add_foreign_key :attendances, :users
    add_foreign_key :classrooms, :cohorts
    add_foreign_key :attendances, :cohorts
  end
end
