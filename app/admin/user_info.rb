ActiveAdmin.register UserInfo do
  belongs_to :user
  permit_params :name, :user_id, :address_line1, :city,
                :state, :zipcode, :school, :grad_date, :dob

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :address_line1
      f.input :city
      f.input :state
      f.input :zipcode
      f.input :school
      f.input :grad_date
      f.input :dob, start_year: 1900


    end
    f.actions
  end
end
