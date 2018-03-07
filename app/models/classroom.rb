class Classroom < ApplicationRecord
  belongs_to :cohort#, required: false
  has_many :attendances
    accepts_nested_attributes_for :attendances, allow_destroy: true
end
