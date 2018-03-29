ActiveAdmin.register Cohort do#, :as => 'Hgp cohorts'
  permit_params :first_name, :class_date, :attendance_id, :last_name, :users_id, :cohort, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend,:project, :benchmark, :projects
  menu priority: 3
  config.batch_actions = true
    duplicable?
  #active_admin_importable
  sortable tree: true


  index do
    selectable_column
    id_column
    column :city
    column :cohort


    actions
  end

    filter :genius
    filter :cohort
    filter :city
    filter :username


    form do |f|
        ### Declare here the model's own form fields:
      f.inputs "Hgp Cohorts" do
        f.input :city, label: "Office Location", input_html: { class: 'default-select' }
        f.input :cohort, label: "Cohort Number", input_html: { class: 'default-select' }

      end
      f.inputs "Rollcall", collection:[true] do
         f.input :event_id, as: :nested_select,

                     level_1: { attribute: :classroom_id },
                     level_2: { attribute: :cohorts_id  },
                     level_3: { attribute: :event_id }
      end
      f.inputs 'Genius' do
        f.has_many :users,
                        allow_destroy: true,
                        new_record: true do |u|
        u.semantic_errors *f.object.errors.keys
        u.input :genius
        u.input :cell
        u.input :email
        u.input :password, input_html: { autocomplete: "new-password" }
        u.input :email2
        u.input :username
        u.input :avatar, as: :file
        if u.object.avatar.present?
          u.semantic_fields_for :avatar_attributes do |avatar_fields|
           avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
         #end
       end
     end
   end

      f.actions
      end
    end
  end  ### Declare here the form for the child model, using the "has_many" method: