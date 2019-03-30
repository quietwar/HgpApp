ActiveAdmin.register Schedule do
  belongs_to :event, optional: true
  menu parent: "Event"
  permit_params :upcoming, :past, :time, :date
  #menu priority: 5
    duplicable?


      index do
        selectable_column
        id_column
        column :date
        column :time


        actions
      end

    filter :created_at, as: :date_time_range


    form do |f|
      f.input :starts_at, as: :date_time_picker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }
      f.input :ends_at,   as: :date_time_picker, datepicker_options: { min_date: 3.days.ago.to_date, max_date: "+1W +5D" }
    end
        #content do
      #index_as_calendar
    #   ({:ajax => true, :includes => [:genius]}) #|attendance|
    #   {
    #     id: attendances.id,
    #     title: attendance.genius.name,
    #     start: attendance.issue_date,
    #     #url: "#{admin_invoice_path(item)}",
    #     tooltip: {
    #      title: "Due date #{attendance.due_date.to_s}",
    #      text: attendance.balance.blank? ? nil : attendance.balance.to_s
    #     },
    #     color: attendance.balance>0 ? (attendance.due_date.blank? ? 'green' : (attendance.due_date <= DateTime.now.beginning_of_day ? 'red' : 'olive' )) : 'green',
    #     textColor: 'white'
    #   }
    # end
      #render partial: 'calendar'


    breadcrumb do
      ['admin', 'calendar']
      para "Hello World"
    end
  end
  #end
