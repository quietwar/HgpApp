class RenameColumnUser < ActiveRecord::Migration[5.2]
  def change
    #rename_column :users, :benchmarks, :name
    #add_column :users, :cohort_id, :integer
    add_column :users, :address, :string
    #add_foreign_key :users, :cohorts
  end
end
