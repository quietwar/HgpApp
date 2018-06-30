class AddTableClassroom < ActiveRecord::Migration[5.1]
  def change
    add_column :classrooms, :users_id, :integer
    add_column :classrooms, :classroom_id, :integer
    add_column :classrooms, :attendance_id, :integer
  end
end
