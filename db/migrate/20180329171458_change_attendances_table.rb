class ChangeAttendancesTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :attendances_tables, :attendances
  end
end
