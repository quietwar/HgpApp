class AddtoClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :name, :string
    add_reference :classrooms, :users
  end
end
