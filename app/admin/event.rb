ActiveAdmin.register Event do
  #has_many :schedules
  menu priority: 4
  duplicable?
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :event, :notes, :location
 #menu priority: 5

 # index as: :map do
 #   column  :longitude
 #   column  :latitude
 #  end
 #
 index do
   selectable_column
   id_column
   column :admin_id
   column :event
   #column :location
   column :notes
   column :created_at
   actions
 end

 filter :admin_id
 filter :event
 filter :notes
 filter :created_at

 form do |f|
   f.inputs do
     f.input :event
     f.input :location
     f.input :notes

   end
   f.actions

   end
   #page_action :add_event :post do
    # ...
    #redirect_to admin_event_path, notice: "Your event was added"

  # action_item :add do
  #   link_to "Add Event", admin_calendar_add_event_path, method: :post
  # end
end
#end
