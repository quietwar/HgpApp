ActiveAdmin.register Attendance do
  belongs_to :genius
  navigation_menu :genius


  form do |f|
          ### Declare here the model's own form fields:
  f.inputs "Attendance" do
    f.input :ends_at, as: :datepicker,
                    datepicker_options: {
                      min_date: 3.days.ago.to_date,
                      max_date: "+1W +5D"
                    }
   end
 end
end
