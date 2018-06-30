class Schedule < ApplicationRecord
    belongs_to :event, optional: true
    accepts_nested_attributes_for :event, :allow_destroy => true
end
