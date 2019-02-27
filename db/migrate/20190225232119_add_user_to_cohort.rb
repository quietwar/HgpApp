class AddUserToCohort < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :users, :string
    add_column :cohorts, :cohort_number, :integer  
  end
end
