ActiveAdmin.register User, as: 'Genius' do
  permit_params :avatar, :name, :classroom_id, :first_name, :cohort, :last_name, :username, :email, :email2, :cell, :password, :password_confirmation, :stipend, :address, :benchmarks, :genius, :attendance_id, :users_id, :cohort_id, :city, :projects_attributes, avatar_attributes: [:_destroy]
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
        column :classroom_id
        column :sign_in_count
        column :created_at
        image_column :avatar, style: :thumb

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
    f.inputs do
      f.semantic_errors *f.object.errors.keys
      f.input :genius
      f.input :cohort_id
      f.input :city
      f.input :cell
      f.input :email
      f.input :password, input_html: { autocomplete: "new-password" }
      f.input :email2
      f.input :username
      f.input :classroom_id
      f.input :avatar, as: :file
      if f.object.avatar.present?
        f.semantic_fields_for :avatar_attributes do |avatar_fields|
         avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
       end
     end
   end
# ActiveAdmin.register_page "Project" do
   #   belongs_to :genius
      f.inputs 'Projects' do
              f.has_many :projects, allow_destroy: true,
                                    new_record: true do |u|

        u.input :app_name
        u.input :coding
        u.input :project_details
        u.input :start_date
        u.input :github

       end
       f.actions
           end
         end
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