class AddToAttendancesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :present, :boolean
    add_column :attendances, :absent, :boolean
    add_column :attendances, :halfday, :boolean
    add_column :attendances, :class_date, :datetime
  end
end
