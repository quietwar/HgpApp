class AddToCohortCityId < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :city_id, :string
  end
end
