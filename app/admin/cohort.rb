ActiveAdmin.register Cohort do#, :as => 'Hgp cohorts'
  permit_params :genius, :city, :cohort, user_attributes: [:first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend, :project], attendances_attributes: [:class_date, :absent,  :present, :halfday]
  menu priority: 3
  config.batch_actions = true
    duplicable?
  #active_admin_importable
  sortable tree: true

  controller do
    def create
        # @cohort = Cohort.find(params)
        # @user = User.find(params)
        # #params[:genius][:cohort] = @cohort.genius
        # params[:cohort][:user] = @user.cohort
        @cohort = Cohort.new(params[:cohort_id])
      super
    end
    def show
      @cohort = Cohort.find_by_id(params[:cohort_id])
    end
   end

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
    f.inputs "HGP Cohorts" do
     f.input :city
     f.input :cohort_id
     #f.input :users
       end
    # end

     f.inputs "Geniuses"
     f.inputs do #:users
       f.has_many :users,allow_destroy: true,
                             new_record: false do |ff|
         ff.input :genius
         ff.input :cell
         ff.input :email
         ff.input :password, input_html: { autocomplete: "new-password" }
         ff.input :email2
         ff.input :username
         ff.input :avatar, as: :file
         if ff.object.avatar.present?
           ff.semantic_fields_for :avatar_attributes do |avatar_fields|
            avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
        end
      end
    end
   f.actions
   end
  end
 end
#end



      #   ### Declare here the model's own form fields:
      # f.inputs "Hgp Cohorts" do
      #   f.input :city, label: "Office Location", input_html: { class: 'default-select' }
      #   f.input :cohort, label: "Cohort Number", input_html: { class: 'default-select' }
      #   f.input :genius, input_html: { class: 'default-select' }
      #
      # end

        # f.inputs "Rollcall", collection:[true] do
        #    f.input :user_id, as: :nested_select,
        #
        #                level_1: { attribute: :city_id },
        #                level_2: { attribute: :cohorts_id  },
        #                level_3: { attribute: :user_id }
        # end
      # f.input :category_id, as: :search_select, url: admin_categories_path,
      # fields: [:name, :description], display_name: 'name', minimum_input_length: 2,
      # order_by: 'description_asc'

     #  f.inputs "Rollcall", collection:[true] do
     #     f.input :attendance_id, as: :nested_select,
     #
     #                 level_1: { attribute: :classroom_id },
     #                 level_2: { attribute: :cohorts_id  },
     #                 level_3: { attribute: :attendance_id }
     #  end
     #


  #end
#end
#end  ### Declare here the form for the child model, using the "has_many" method:
