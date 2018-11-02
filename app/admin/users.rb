ActiveAdmin.register User do
  belongs_to :cohort, optional: true
  scope :all, default: true

  permit_params :avatar, :genius, :classroom_id, :first_name, :cohort, :last_name, :username, :email, :email2, :cell, :password, :password_confirmation, :stipend, :address, :benchmarks, :genius, :attendance_id, :users_id, :cohorts_id, :city, :projects_attributes, avatar_attributes: [:_destroy]
  config.batch_actions = true
  menu priority: 4
   duplicable?
  #active_admin_importable




      index do
        selectable_column
        id_column
        column :first_name
        column :last_name
        column :email
        column :email2
        column :username
        column :address
        column :cell
        column :projects
        column :sign_in_count
        column :created_at
        #image_column :avatar, style: :thumb

        actions
      end



  filter :genius
  filter :cohort
  filter :city
  filter :stipend
  filter :benchmarks
  filter :username
  filter :feature
  filter :sign_in_count
  filter :created_at


  form do |f|
    f.inputs 'Genius' do
      f.semantic_errors *f.object.errors.keys
      f.input :genius
      f.input :cohort_id
      f.input :city
      f.input :cell
      f.input :email
      f.input :password, input_html: { autocomplete: "new-password" }
      f.input :email2
      f.input :username
      f.input :avatar, as: :file
      if f.object.avatar.present?
        f.semantic_fields_for :avatar_attributes do |avatar_fields|
         avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
       #end
     end
   end
 end

    f.inputs 'Projects'
    f.inputs do
      f.has_many :projects, allow_destroy: true,
                                new_record: false do |u|
          u.input :app_name
          u.input :coding
          u.input :project_details
          u.input :start_date
          u.input :github
      end
     end
       f.actions
     #end
   end

     controller do
       # Instruct Inherited Resources to use `parent.scorecards` to find the related records.
         defaults :collection_name => "Genius"

         #belongs_to :cohort#, polymorphic: true

         def update
            if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
              params[:user].delete('password')
              params[:user].delete('password_confirmation')
            end
            super
         end

       def create
             @cohort = Cohort.find(params[:geniuses][:cohort])
             @genius = Genius.find(params[:cohort][:geniuses])
             params[:genius][:cohort] = @cohort.genius
             params[:cohort][:genius] = @genius.cohort
             @cohort = Cohort.new(params[:cohort])
           super
       end
     end
     #end
   end

   # sidebar :custom, only: :show do
   #   resource.a_attendance
   #        f.input :ends_at, as: :datepicker,
   #                  datepicker_options: {
   #                    min_date: 3.days.ago.to_date,
   #                    max_date: "+1W +5D"
   #                  }
   #            end

      # sidebar project: :show do
      #   attributes_table_for genius do
      #     #row("Total Projects") { genius.projects.complete.count }
      #     row("Total Value") do
      #     end
      #   end
      # end
   #end
 #end
