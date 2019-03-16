class AddtoSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :name, :string
    add_column :schedules, :end_time, :datetime
    add_column :schedules, :start_time, :datetime
    add_reference :schedules, :events
  end
end
