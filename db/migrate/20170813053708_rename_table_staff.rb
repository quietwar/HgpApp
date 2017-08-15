class RenameTableStaff < ActiveRecord::Migration[5.0]
  def change
    rename_table :staff_cohort, :admin_cohorts
  end
end
