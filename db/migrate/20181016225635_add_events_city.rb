class AddEventsCity < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :address, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :latitude, :integer
    add_column :events, :longitude, :integer
  end
end
