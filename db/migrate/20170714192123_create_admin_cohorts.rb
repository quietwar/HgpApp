class CreateAdminCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_cohorts do |t|
      t.references :admin, foreign_key: true
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
