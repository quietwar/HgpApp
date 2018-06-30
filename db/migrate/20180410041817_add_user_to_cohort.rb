class AddUserToCohort < ActiveRecord::Migration[5.1]
  def change
    remove_column :cohorts, :cohort, :integer
    remove_column :cohorts, :city, :bigint
  end

  def change
    add_column :cohorts, :user, :string
  end
end
