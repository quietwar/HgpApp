# ActiveAdmin.register Project do
#   belongs_to :user, :optional => true
#   #permit_params :app_name, :coding, :project_details, :github, :url, :start_date
#
#      index do
#        selectable_column
#        id_column
#        column :app_name
#        column :coding
#        column :github
#
#        actions
#      end
#
#        filter :app_name, label: 'Project name'
#        filter :coding, label: "Primary language"
#        #filter :city, as: :select
#        #filter :username
#
#
#      form do |f|
#         #   ### Declare here the model's own form fields:
#         f.inputs "Projects" do
#          f.semantic_errors *f.object.errors.keys
#             f.input :app_name, label: "Project name", input_html: { class: 'default-select' }
#             f.input :coding, label: "Primary Langague", input_html: { class: 'default-select' }
#             f.input :project_details, label: "Description"
#             f.input :github, label: "Github repositiory link"
#             f.input :url
#         end
#       end
#     end
#   #end
