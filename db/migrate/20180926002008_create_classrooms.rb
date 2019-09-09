class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :genius
      t.integer :cohort_id
      t.string :attendances
    end
  end
end
