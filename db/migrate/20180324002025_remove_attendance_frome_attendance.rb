class RemoveAttendanceFromeAttendance < ActiveRecord::Migration[5.2]
  def change
    remove_column :attendances, :status, :string
    remove_column :attendances, :here, :boolean
    remove_column :attendances, :ghost, :boolean
    remove_column :attendances, :not_here, :boolean
    remove_column :attendances, :attendances, :string
    remove_column :attendances, :no_show, :boolean
  end
end
