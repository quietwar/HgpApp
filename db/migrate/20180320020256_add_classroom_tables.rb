class AddClassroomTables < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :names, :string
    add_column :classrooms, :city, :string
    #add_column :classrooms, :email, :string
  end
end
