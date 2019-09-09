ActiveAdmin.register Cohort
ActiveAdmin.register User do
  belongs_to :cohort, optional: true
  scope :all, default: true
  preserve_default_filters!

  #filter :posts, as: :select, collection: -> { Post.pluck(:title, :id) }


  permit_params :id, :name, :cohort_number, :avatar, :classroom_id, :cohort, :username, :email, :email2, :cell, :password, :password_confirmation, :stipend, :address, :benchmarks, :attendance_id, :user_id, :cohort_id, :city, :projects_attributes, avatar_attributes: [:_destroy]
  config.batch_actions = true
  menu priority: 4
   duplicable?
   active_admin_import

   batch_action :bulk_set_email do |ids|
     render "admin/users/bulk_set_email", locals: {
       form: Admin::Users::BulkSetEmailForm.new(ids)
     }
   end

   collection_action :bulk_set_email, method: :put do
     form = Admin::Users::BulkSetEmailForm.new(
       params.fetch(:users).fetch(:users_ids)
     )

     if form.submit(params.fetch(:users))
       redirect_to admin_users_path, notice: "Users emails updated"
     else
       flash[:notice] = "There was a problem updating users emails"
       render "admin/users/bulk_set_email", locals: {
         form: form
       }
     end
   end



      index do
        selectable_column
        id_column
        column :user_id
        column :city
        column :cohort_number
        column :email
        column :email2
        column :username
        column :address
        column :cell
        column :projects
        # column :sign_in_count
        # column :created_at
        #image_column :avatar, style: :thumb

        actions
      end

      # show title: :genius do
      #   panel "Projects" do
      #     table_for(user.projects) do
      #       column("Project", sortable: :id) do |project|
      #         link_to "##{project.id}", admin_project_path(project)
      #       end
      #       column("State") { |project| status_tag(project.state) }
      #       column("Date", sortable: :checked_out_at) do |order|
      #         pretty_format(order.checked_out_at)
      #       end
      #       column("Total") { |project| number_to_currency project.total_price }
      #     end
      #   end



      filter :cohort_number
      filter :city, as: :select
      filter :stipend
      filter :projects
      filter :benchmarks
      filter :username
      filter :feature
      filter :sign_in_count
      filter :created_at

    show title: :name do
      panel "Attendance History" do
        table_for(user.attendances) do
          column("Attendance", sortable: :id) do |attendance|
            link_to "##{attendance.id}", admin_attendance_path(attendance)
          end
          column("State") { |attendance| status_tag(order.state) }
          column("Date", sortable: :checked_out_at) do |attendance|
            pretty_format(attendance.checked_out_at)
          end
          column("Total") { |attendance| number_to_currency attendance.total_price }
        end
      end
     columns do
      column do
        panel "Genius Address" do
              table_for(@user) do
                column("name") do |a|
                  link_to "user_id"
                    admin_user_user_info_path(:id)
                end
                column("Address") do |a|
                  span :address_line1.to_s
                  br :address_line2.to_s
                end
                column :city
                column :state
                column :country
                column :zipcode
                column :school
                column :grad_date
                column :dob
                tr class: "action_items" do
                  td link_to("Edit Genius", new_admin_user_user_info_path(:id),
                             class: :button)
                end
              end
    form do |f|
        f.inputs 'Genius'  do
          f.input :city#, as: :select2
          f.input :cohort_number#, as: :select2
          f.input :name, input_html: { autocomplete: "Genius" }
          f.input :cell
          f.input :email
          f.input :password, input_html: { autocomplete: "new-password" }
          f.input :password_confirmation, input_html: { autocomplete: "new-password" }
          f.input :email2
          f.input :username
          #f.input :image, as: :file
          # if f.object.image.present?
          #   f.semantic_fields_for :avatar_attributes do |avatar_fields|
          #    avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
          #  end
           #action_items
         end
         end
      end
    end
  end
 end
end
#end
