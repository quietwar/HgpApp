class AddAncestryToClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :ancestry, :string
  end
end
