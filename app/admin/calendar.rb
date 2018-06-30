ActiveAdmin.register Event do
ActiveAdmin.register_page "Calendar" do
  belongs_to :event, :optional => true
   content do
     para "Genius Whisperers"
     #render partial: 'calendar'
   end
   breadcrumb do
    ['admin', 'calendar']
  end

   controller do

    def events

      @start_date = Time.at(params[:start].to_i).to_date
      @end_date = Time.at(params[:end].to_i).to_date

      respond_to do |format|
        format.json { render :json => @events.as_json(:user => current_admin_user) }
      end
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
 end
