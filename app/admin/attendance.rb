ActiveAdmin.register Attendance do
   belongs_to :user, :optional => true
  permit_params :attendances, :genius, :class_date, :full_name, :city_id, :users_id [1], :cohorts_id [1], :attendance_id ["present, Absent, Halfday"]#, :genius, :cohort, :username,  :city, :attendances,  :classroom_id#, :stipend,:project, :benchmark, :projects
  menu priority: 7
  #navigation_menu :genius
  duplicable?

  index do
    selectable_column
    id_column
    column :genius
    column :city
    column :cohort
    column :present
    column :absent
    column :halfday

    actions
  end


  form do |f|
    ### Declare here the model's own form fields:
    # f.input :attendance_id, as: :search_select, url: admin_attendances_path(:id),
    #   fields: [:genius, :description], display_name: 'genius', minimum_input_length: 2,
    #   order_by: 'description_asc'
    f.inputs "Attendance"
    f.inputs do
        f.input :attendance_id, as: :nested_select,

                   level_1: {attribute: :cohort_ids,
                    collection: Cohort.all},
                   level_2: { attribute: :users_id,
                    collection: User.all },
                   level_3: { attribute: :attendance_id,
                    collection: Attendance.all}
              ### Declare here the model's own form fields:
        #end
      #end
    # form :html => { :enctype => "multipart/form-data" } do |ff|
      #ff.inputs "Take Roll" do
        # ff.input :name
        # ff.input :start_date, :as => :string, :input_html => {:class => "hasDatetimePicker"}
        # ff.input :start_time, :as => :time_picker
    #f.input :class_date do |c|
    # c.input :class_date, :as => :string, :input_html => {:class => "hasDatetimePicker"}

    #c.input :class_date, :as => :string, :input_html => {:class => "hasDatetimePicker"}

    end
  #end
  f.actions
     #end
     #end
    end
   end
