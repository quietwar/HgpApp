ActiveAdmin.register Cohort do#, :as => 'Thgp cohorts'
  permit_params :name, :genius, :city, :cohort,
                users_attributes: [:first_name, :last_name, :username, :genius, :cohort_number, :city, :email, :email2, :cell, :stipend, :project],
                attendances_attributes: [:class_date, :absent,  :present, :halfday]
  menu priority: 3
  config.batch_actions = true
    duplicable?
     active_admin_import
  sortable tree: true



   index do
     selectable_column
     id_column
     column :city
     column :cohort_number

     actions
   end

     filter :genius
     filter :cohort_number
     filter :city
     #filter :username


   form do |f|
      #   ### Declare here the model's own form fields:
      f.inputs "Hgp Cohorts" do
       f.semantic_errors *f.object.errors.keys
        f.input :city, label: "Office Location", input_html: { class: 'default-select' }
        f.input :cohort_number, label: "Cohort Number", input_html: { class: 'default-select' }

      end

      #   ### Declare here the form for the child model, using the "has_many" method:
           f.inputs 'Geniuses' do
                f.has_many :users, allow_destroy: true,
                                  new_record: true  do |user|
                  f.semantic_errors *f.object.errors.keys
                user.input :name
                user.input :cell
                user.input :email
                user.input :password, input_html: { autocomplete: "new-password" }
                user.input :password_confirmation, input_html: { autocomplete: "new-password" }
                user.input :email2
                user.input :username
                user.input :avatar, as: :file
        end
        f.actions
      end
  end
end
 
