ActiveAdmin.register Cohort do#, :as => 'Hgp cohorts'
  permit_params :name, :genius, :city, :cohort, user_attributes: [:first_name, :last_name, :username, :genius, :cohort_number, :city, :email, :email2, :cell, :stipend, :project], attendances_attributes: [:class_date, :absent,  :present, :halfday]
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
        f.input :cohort_id, label: "Cohort Number", input_html: { class: 'default-select' }

      end

      #   ### Declare here the form for the child model, using the "has_many" method:
           f.inputs 'Geniuses'
              f.inputs do
                f.has_many :users, allow_destroy: true,
                                  new_record: true  do |user|
                  f.semantic_errors *f.object.errors.keys
                user.input :name
                user.input :cell
                user.input :email
                user.input :password, input_html: { autocomplete: "new-password" }
                user.input :email2
                user.input :username
                user.input :avatar, as: :file
        end
        f.actions
      end
  end
end

                #f.inputs "Rollcall", collection:[true] do
        #    f.input :user_id, as: :nested_select,
        #
        #                level_1: { attribute: :city_id },
        #                level_2: { attribute: :cohorts_id  },
        #                level_3: { attribute: :user_id }

      # f.input :category_id, as: :search_select, url: admin_categories_path,
      # fields: [:name, :description], display_name: 'name', minimum_input_length: 2,
      # order_by: 'description_asc'

     #  f.inputs "Rollcall", collection:[true] do
     #     f.input :attendance_id, as: :nested_select,
     #
     #                 level_1: { attribute: :classroom_id },
     #                 level_2: { attribute: :cohorts_id  },
     #                 level_3: { attribute: :attendance_id }
#end  ### Declare here the form for the child model, using the "has_many" method:
