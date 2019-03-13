ActiveAdmin.register Cohort do#, :as => 'Hgp cohorts'
  permit_params :name, :genius, :city, :cohort, user_attributes: [:first_name, :last_name, :username, :genius, :cohort_number, :city, :email, :email2, :cell, :stipend, :project], attendances_attributes: [:class_date, :absent,  :present, :halfday]
  menu priority: 3
  config.batch_actions = true
    duplicable?
  active_admin_importable
  sortable tree: true

  # controller do
  #   def create
  #       # @cohort = Cohort.find(params)
  #       # @user = User.find(params)
  #       # #params[:genius][:cohort] = @cohort.genius
  #       # params[:cohort][:user] = @user.cohort
  #       @cohort = Cohort.new(params[:cohort_id])
  #     super
  #   end
  #   def show
  #     @cohort = Cohort.find_by_id(params[:cohort_id])
  #   end
  #  end

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
  #   f.inputs "HGP Cohorts" do
  #     f.semantic_errors *f.object.errors.keys
  #      f.input :city, label: "HGP Site"
  #      f.input :cohort_id, label: "Cohort Number"
  #   end

  #   ### Declare here the form for the child model, using the "has_many" method:


  #   f.inputs "Geniuses" do
  #     f.has_many :users, allow_destroy: true,
  #                           new_record: true do |u|
  #         u.input :genius, label: "Genius"
  #         u.input :cell
  #         u.input :email
  #         u.input :password, input_html: { autocomplete: "new-password" }
  #         u.input :email2
  #         u.input :username
  #         u.input :avatar, as: :file
  #      #    if f.object.avatar.present?
  #      #      f.semantic_fields_for :avatar_attributes do |avatar_fields|
  #      #       avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
  #       end

  #    end
  #    f.actions
  #   end
  #  end
  #end

#end



      #   ### Declare here the model's own form fields:
      f.inputs "Hgp Cohorts" do
        f.input :city, label: "Office Location", input_html: { class: 'default-select' }
        f.input :cohort_id, label: "Cohort Number", input_html: { class: 'default-select' }
        #f.input :genius, input_html: { class: 'default-select' }

      end

           f.inputs 'Geniuses'
              f.inputs do
                f.has_many :users, allow_destroy: true,
                                  new_record: true  do |user|
                  f.semantic_errors *f.object.errors.keys
                user.input :genius
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
