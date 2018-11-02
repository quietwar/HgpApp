ActiveAdmin.register Classroom do
  permit_params :avatar, :name, :first_name, :cohort, :last_name, :username, :email, :email2, :cell, :password, :password_confirmation, :stipend, :address, :benchmarks, :genius, :cohort_id, :city, :projects_attributes, avatar_attributes: [:_destroy]
  config.batch_actions = true
  menu priority: 6
  duplicable?

  index do
    selectable_column
    id_column
    column :city
    column :cohort


    actions
  end

  # table Attendance do
  #    column(:genius) { |attendance| }
  #    column "Session day", :created_at
  #    column "Present", :important, as: :boolean
  #    column "Absent",  :important, as: :boolean
  #    column "halfday", :important, as: :boolean
  # end

    filter :genius
    filter :cohort
    filter :city
    filter :username


    form do |f|
    f.semantic_errors    ### Declare here the model's own form fields:
    f.inputs "Hgp Cohorts" do
      f.input :city, label: "Office Location"
      #f.input :classroom, label: "Cohort Number"
    end


      f.input :attendances, as: :nested_select,
                  level_1: { attribute: :cohort_id },
                  level_2: { attribute: :genuis_id },
                  level_3: { attribute: :attendances }

      sidebar :help do
      "Need help? Email us at help@example.com"
   end


  f.actions
  
  end

  #content do
    #index_as_calendar
  #   ({:ajax => true, :includes => [:genius]}) #|attendance|
  #   {
  #     id: attendances.id,
  #     title: attendance.genius.name,
  #     start: attendance.issue_date,
  #     #url: "#{admin_invoice_path(item)}",
  #     tooltip: {
  #      title: "Due date #{attendance.due_date.to_s}",
  #      text: attendance.balance.blank? ? nil : attendance.balance.to_s
  #     },
  #     color: attendance.balance>0 ? (attendance.due_date.blank? ? 'green' : (attendance.due_date <= DateTime.now.beginning_of_day ? 'red' : 'olive' )) : 'green',
  #     textColor: 'white'
  #   }
  # end
    #render partial: 'calendar'


  breadcrumb do
    ['admin', 'classroom']
    para "Hello Genius"
  end
#end
end
