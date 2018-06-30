ActiveAdmin.register Cohort do#, :as => 'Hgp cohorts'
  permit_params :city, :cohort_id, :genius, users_attributes: [:last_name, :users_id, :cohort, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend, :project], attendances_attributes: [:present, :absent, :halfday, :class_date], classroom_attributes: [:id, :body, :_destroy]

  menu priority: 3
  config.batch_actions = true
    duplicable?
  #active_admin_importable
  sortable tree: true

    form do |f|
      f.inputs 'Hgp Cohorts', :body
      f.inputs do
        f.input :city, label: "Office Location"
        f.input :cohort, label: "Cohort Number"
      end
      f.inputs "Geniuses" do
        f.has_many :users,allow_destroy: true,
                              new_record: false do |a|
          a.input :genius
          a.input :cell
          a.input :email
          a.input :password, input_html: { autocomplete: "new-password" }
          a.input :email2
          a.input :username
          a.input :avatar, as: :file
          if user.object.avatar.present?
            uuser.semantic_fields_for :avatar_attributes do |avatar_fields|
             avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
          end
       end
      end
    end
      f.actions
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
        ### Declare here the model's own form fields:

        ### Declare here the form for the child model, using the "has_many" method:



  controller do
    def create
      @cohort = Cohort.find(params[:user][:cohort])
      @user = User.find(params[:cohort][:user])
      params[:user][:cohort] = @cohort.user
      params[:cohort][:user] = @user.cohort
      @cohort = Cohort.new(params[:cohort])
      super
    #end
   end
  end
 end
end  ### Declare here the form for the child model, using the "has_many" method:
