class RemoveAttributesFromCohort < ActiveRecord::Migration[5.1]
  def change
    remove_column :cohorts, :admin_id, :integer
    remove_column :cohorts, :email, :string
    remove_column :cohorts, :email2, :string
    remove_column :cohorts, :stipend, :integer
    remove_column :cohorts, :benchmark, :string
    remove_column :cohorts, :name, :string
    remove_column :cohorts, :last_name, :string
    remove_column :cohorts, :first_name, :string
    remove_column :cohorts, :cell, :bigint
    remove_column :cohorts, :projects, :string
    remove_column :cohorts, :user_id, :integer 

  end
end
