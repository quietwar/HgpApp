class UserInfo < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id
  validates_associated  :user

  validates_presence_of :name
  validates_presence_of :address_line1
  validates_presence_of :city
  validates_presence_of :grad_date
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :school
  validates_presence_of :dob
end
