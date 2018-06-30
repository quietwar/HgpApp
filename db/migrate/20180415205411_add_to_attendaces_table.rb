class AddToAttendacesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :city_id, :string
  end
end
