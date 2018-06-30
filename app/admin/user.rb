ActiveAdmin.register User do#, as: 'Genius' do
# ActiveAdmin.register_page "Project" do
permit_params projects_attributes: [:app_name, :coding, :project_details, :start_date, :github],
                attendances_attributes: [ :id, :start_time, :end_time, :_destroy ]

  form do |f|
   #   belongs_to :genius
    f.inputs 'Projects' do
      f.input :app_name
        f.has_many :projects, allow_destroy: true,
                                  new_record: true do |u|
            u.input :app_name
            u.input :coding
            u.input :project_details
            u.input :start_date
            u.input :github
            #end
           end
       f.actions
            end
           end
         end
       #end




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
