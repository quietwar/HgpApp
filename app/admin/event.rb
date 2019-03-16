ActiveAdmin.register Event do
  duplicable?
 permit_params :event, :notes, :location
 menu priority: 5

 action_item :only => [:show, :edit] do
     link_to('Edit Registrants', admin_event_schedule_registrations_path(event))
   end

   show do |o|
       attributes_table do
         row :title
         row :starts_on
         row :ends_on
         row :description
       end

       panel "Registrants" do
         if o.event_registrations.present?
           table_for o.event_registrations do
             column :first_name
             column :last_name
             column :email
           end
         else
           "There are no registrations for this event, yet."
         end
       end
     end

     index do
       column :title
       column :starts_on
       column :ends_on
       column :registrants do |e|
         e.event_registrations.size
       end
       default_actions
     end
   end
# # index as: :map do
#  #   column  :longitude
#  #   column  :latitude
#  #  end
#  #
#    index do
#      selectable_column
#      id_column
#      column :admin_id
#      column :event
#      column :location
#      column :notes
#      column :created_at
#      actions
#    end
#
#    filter :admin_id
#    filter :event
#    filter :notes
#    filter :created_at
#
#    form do |f|
#      f.inputs do
#        f.input :event
#        f.input :location
#        f.input :address
#        f.input :city
#        f.input :notes
#
#
#      end
#      f.actions
#        link_to "Add Event", admin_event_path(:id), method: :post
#    end
#
#    end

#end
#end
