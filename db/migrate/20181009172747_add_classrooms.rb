class AddClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :city, :string
  end
end
