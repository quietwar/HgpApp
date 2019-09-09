class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :genius
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :city
      t.bigint :cohort_id

      t.timestamps
    end
  end
end
