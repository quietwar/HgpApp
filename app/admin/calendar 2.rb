ActiveAdmin.register Event do
ActiveAdmin.register_page "Calendar" do
  belongs_to :schedule, optional: true
  menu parent: "Schedule"

   content do
     para "Genius Whisperers"
     render partial: 'calendar'
   end

   controller do

     def index
       @calendar = Calendar.new(schedule_params)
       @calendars = Calendar.all[:schedule_id]
     end

     def create
       @cohort = Cohort.find(params[:user][:cohort])
       @user = User.find(params[:cohort][:user])
       params[:user][:cohort] = @cohort.user
       params[:cohort][:user] = @user.cohort
       @cohort = Cohort.new(params[:cohort])
       super
     #end
    end
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
