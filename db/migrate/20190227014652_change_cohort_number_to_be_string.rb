class ChangeCohortNumberToBeString < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :cohort_id, :cohort_number
  end
end
