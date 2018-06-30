class AddAncestryToClassrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :ancestry, :string
  end
end
