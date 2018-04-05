class CreateAttendancesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances_tables do |t|
      t.string :user_id
      t.string :cohort_id
      t.string :attendance_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :datepicker
      t.boolean :present
      t.boolean :absent
      t.boolean :halfday

      t.timestamp null: false
    end
  end
end
