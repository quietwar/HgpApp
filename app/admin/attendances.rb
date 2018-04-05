ActiveAdmin.register Attendance do
  belongs_to :user
  permit_params :class_date, :city_id, :user_id [1], :cohort_id [1], :attendance_id ["present, Absent, Halfday"]#, :genius, :cohort, :username,  :city, :attendances,  :classroom_id#, :stipend,:project, :benchmark, :projects
  menu priority: 6
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

    f.inputs "Rollcall", collection:[true] do
       f.input :attendance_id, as: :nested_select,

                   level_1: { attribute: :cohort },
                   level_2: { attribute: :users },
                   level_3: { attribute: :attendance_id }

      end
        f.inputs "class_date" do
          f.input :updated_at, as: :date_time_picker
                          # datepicker_options: {
                          #   min_date: 3.days.ago.to_date,
                          #   max_date: "+1W +5D"
                          # }
         end
       end
      end
