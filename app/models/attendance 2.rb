class Attendance < ApplicationRecord
  belongs_to :user, optional: true
  validates :start_time, :end_time, presence: true

end
