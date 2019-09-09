class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :full_name
      t.string :address_line1
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :school
      t.datetime :grad_date
      t.datetime :dob
      t.bigint :user_id
	    t.bigint :cohort_id

      t.index [ :user_id ], unique: true
  		t.index [ :cohort_id ], unique: false

      t.timestamps
    end
  end
end
