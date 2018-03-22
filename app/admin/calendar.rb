ActiveAdmin.register_page "Calendar" do


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
