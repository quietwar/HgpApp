ActiveAdmin.register Cohort do#, :as => 'Thgp cohorts'
  permit_params :name, :user_id, :city, :cohort_id, :cohort_number,
                users_attributes: [:password, :user_id, :password_confirmation, :name, :username, :cohort_number, :cohort_id, :city, :email, :email2, :cell, :stipend, :project],
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

     filter :users, label: 'Genius'
     filter :cohort_number
     filter :city, as: :select
     #filter :username
     show do
      columns do
       column do
         panel "Geniuses" do
               table_for(cohort.users) do
                 column("Geniuses") do |u|
                   #link_to u.full_name.to_s(admin_cohort_user_path(:cohort_id, :user_id), class: :button)
                 #end
                 # column("Genius") do |c|
                 #   # span
                 #   # br u
                  #end

                 column :name, label: 'Genius'
                 column :cell
                 column :email
                 column :email2
                 column :username
                end
               end
             end
             active_admin_comments
           end
     #     columns do
     #      column do
     #        panel "Genius Address" do
     #              table_for(@user) do
     #                column("name") do |a|
     #                  link_to "user_id"
     #                    admin_user_user_info_path(user)
     #                end
     #                column("Address") do |a|
     #                  span :address_line1.to_s
     #                  br :address_line2.to_s
     #                end
     #                column :city
     #                column :state
     #                column :country
     #                column :zipcode
     #                column :school
     #                column :grad_date
     #                column :dob
     #                tr class: "action_items" do
     #                  td link_to("Edit Genius", new_admin_user_user_info_path(user),
     #                             class: :button)
     #                end
     #              end
     #
     # form do |f|
     #     f.input  "Hgp Cohorts" do
     #        f.input :city, label: "Office Location", input_html: { class: 'select2' }
     #        f.input :cohort_number, label: "Cohort Number", input_html: { class: 'select2' }
     #      end
     #    #   ### Declare here the form for the child model, using the "has_many" method:
     #        f.input do |user|
     #
     #          f.has_many :users, allow_destroy: true,
     #                                  new_record: true  do |user|
     #              user.input
     #              #f.semantic_errors *f.object.errors.keys
     #              user.input :name, label: 'Genius-full_name'
     #              user.input :cell
     #              user.input :email
     #              user.input :password, input_html: { autocomplete: "new-password" }
     #              user.input :password_confirmation, input_html: { autocomplete: "new-password" }
     #              user.input :email2
     #              user.input :username
     #              user.input :avatar, as: :file
     #              end
     #           end
     #         end
     #        f.actions
     #      end
         end
           # sidebar "Genius Attendance", only: :show do
           #  attributes_table_for @user, :name, :attendance, :created_at
           panel "Add Geniuses" do
                 table_for(@user) do
                   column("name") do |a|
                     link_to "user_id"
                       admin_user_path#(:id)
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
          end
        end
      end
