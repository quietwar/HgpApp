ActiveAdmin.register Attendance do
  belongs_to :user, optional: true
    permit_params :name, :user_id, :class_date, :city_id#,  attendance_id: ["Present, Absent, Halfday"], class_dates_attributes: [ :id, :start_time, :end_time, :_destroy ]
    menu parent: "User"
    #navigation_menu :genius
    duplicable?

    index do
      selectable_column
      id_column
      column :present
      column :absent
      column :halfday

      actions
    end


    form do |f|
          f.inputs "Rollcall",:as => :select, collection:[true] do
            f.semantic_errors *f.object.errors.keys
             f.input :attendance_id, as: :nested_select,
                        level_1: { attribute: :cohort_id },
                        level_2: { attribute: :user_id },
                        level_3: { attribute: :attendance_id }

             f.input :starts_at, as: :datepicker,
                        datepicker_options: {
                          min_date: "2013-10-8",
                          max_date: "+3D"
                        }

                f.input :ends_at, as: :datepicker,
                      datepicker_options: {
                        min_date: 3.days.ago.to_date,
                        max_date: "+1W +5D"
                      }
       end
        f.actions
       end
     end
