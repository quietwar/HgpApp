class Attendance < ApplicationRecord
  belongs_to :user#, required: false
end
