ActiveAdmin.register Attendance do
  #belongs_to :user
  permit_params :class_date, :full_name, :city_id, :users_id [1], :cohort_id [1], :attendance_id ["present, Absent, Halfday"]#, :genius, :cohort, :username,  :city, :attendances,  :classroom_id#, :stipend,:project, :benchmark, :projects
  menu priority: 7
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
    ### Declare here the model's own form fields:
    f.inputs "Rollcall", collection:[true] do
       f.input :attendance_id, as: :nested_select,

                   level_1: { attribute: :cohort },
                   level_2: { attribute: :users },
                   level_3: { attribute: :attendance_id }
              ### Declare here the model's own form fields:
        #end
      end
  f.inputs "Class date" do
    f.input :class_date do |c|
    c.input :class_date, :as => :string, :input_html => {:class => "hasDatetimePicker"}

    #end
  end
  f.actions
     #end
     end
    end
   end
