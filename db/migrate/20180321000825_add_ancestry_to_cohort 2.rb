class AddAncestryToCohort < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :ancestry, :string
  end
  def change
    add_column :users, :ancestry, :string
  end
  # def change
  #   add_column :classrooms, :ancestry, :string
  # end
end
