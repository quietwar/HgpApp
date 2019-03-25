ActiveAdmin.register Cohort
ActiveAdmin.register User do
  belongs_to :cohort, optional: true
  scope :all, default: true

  permit_params :name, :cohort_number, :avatar, :genius, :classroom_id, :first_name, :cohort, :last_name, :username, :email, :email2, :cell, :password, :password_confirmation, :stipend, :address, :benchmarks, :genius, :attendance_id, :users_id, :cohort_id, :city, :projects_attributes, avatar_attributes: [:_destroy]
  config.batch_actions = true
  menu priority: 4
   duplicable?
   active_admin_import




      index do
        selectable_column
        id_column
        column :genius
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
  filter :cohort_number
  filter :city
  filter :stipend
  filter :projects
  filter :benchmarks
  filter :username
  filter :feature
  filter :sign_in_count
  filter :created_at


  form do |f|
    f.inputs 'Genius' do
      f.semantic_errors *f.object.errors.keys
      #f.input :cohort_
      f.input :cohort, input_html: { class: "select2" }
      f.input :name, input_html: { autocomplete: "Genius" }
      f.input :city, input_html: { class: "select2" }
      f.input :cell
      f.input :email
      f.input :password, input_html: { autocomplete: "new-password" }
      f.input :password_confirmation, input_html: { autocomplete: "new-password" }
      f.input :email2
      f.input :username
      f.input :avatar, as: :file
      if f.object.avatar.present?
        f.semantic_fields_for :avatar_attributes do |avatar_fields|
         avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
       end

       f.actions
     end
   end

   # batch_action_form :flag,  {
   #   type: %w[Offensive Spam Other],
   #   reason: :text,
   #   notes:  :textarea,
   #   hide:   :checkbox,
   #   date:   :datepicker
   # do |ids, inputs|
   #   # inputs is a hash of all the form fields you requested
   #   redirect_to collection_path, notice: [ids, inputs].to_s
   # end



   # sidebar :attendances, :only => :show do
   #   resource.a_attendances
   #        f.input :ends_at, as: :datepicker,
   #                  datepicker_options: {
   #                    min_date: 3.days.ago.to_date,
   #                    max_date: "+1W +5D"
   #                  }
   #            end


      #end
   end
 end
