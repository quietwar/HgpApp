class AddToAttendanceHere < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :not_here, :boolean
  end
end
