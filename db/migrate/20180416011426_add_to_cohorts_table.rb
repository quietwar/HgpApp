class AddToCohortsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :name, :string
  end
end
