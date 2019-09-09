class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
	    t.string :user_id
	    t.string :cohort_id
	    t.string :attendance_id
	    
	    t.datetime :datepicker
	    t.boolean :present
	     
	    t.boolean :ghost
	     
	    t.string :city
  		t.index [ :user_id ], unique: true
  		t.index [ :cohort_id ], unique: false

    end
  end
end
