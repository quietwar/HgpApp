ActiveAdmin.register Cohort do#, :as => 'Hgp cohorts'
  permit_params :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend,:project, :benchmark, :projects
  menu priority: 3
  config.batch_actions = true
    duplicable?
  #active_admin_importable
  #sortable tree: true


  index do
    selectable_column
    id_column
    column :cohort_id
    column :city


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
    filter :cohort_id
    filter :city
    filter :username


    form do |f|
        ### Declare here the model's own form fields:
    f.inputs "Hgp Cohorts" do
      f.input :city, label: "Office Location"
      f.input :cohort_id, label: "Cohort Number"
    end
      ### Declare here the form for the child model, using the "has_many" method:

      f.inputs "Geniuses" do
        f.has_many :users,allow_destroy: true,
                              new_record: true do |user|
          user.input :genius
          user.input :cell
          user.input :email
          user.input :password, input_html: { autocomplete: "new-password" }
          user.input :email2
          user.input :username
          user.input :avatar, as: :file
          if user.object.avatar.present?
            uuser.semantic_fields_for :avatar_attributes do |avatar_fields|
             avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
          end
       end
      end
    f.actions
      end

      # f.input :attendances, as: :nested_select,
      #             level_1: { attribute: :cohort_id },
      #             level_2: { attribute: :genuis_id },
      #             level_3: { attribute: :attendances }

     #  sidebar :help do
     #  "Need help? Email us at help@example.com"
     # end
    end
  end
