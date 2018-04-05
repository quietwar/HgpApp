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

  controller do
    def create
      @cohort = Cohort.find(params[:user][:cohort])
      @user = User.find(params[:cohort][:user])
      #params[:cohort][:level] = @level
      params[:cohort][:user] = @user.cohort
      @cohort = Cohort.new(params[:cohort])
      super
    #end
   end
  end
#end
end  ### Declare here the form for the child model, using the "has_many" method:
