class Attendance < ApplicationRecord
  belongs_to :user, optional: true
  #has_many_a
end
