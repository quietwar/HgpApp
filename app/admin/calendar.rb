ActiveAdmin.register Event do
ActiveAdmin.register_page "Calendar" do
  belongs_to :event
   content do
     para "Genius Whisperers"
     render partial: 'calendar'
   end

   breadcrumb do 
    ['admin', 'calendar']
  end
 end
end
#   permit_params :longitude, :latitude
#   menu priority: 8
#   #navigation_menu :genius
#   duplicable?
#
#   index as: :map do
#     column  :longitude
#     column  :latitude
#    end
#
#
 #end
