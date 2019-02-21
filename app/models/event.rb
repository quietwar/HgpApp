class Event < ApplicationRecord

belongs_to :user

validates :location, :address, :city, :state, :latitude, :longitude, presence: true

# acts_as_schedulable :schedule, occurrences: :event_occurrences
# geocoded_by :full_address
after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
 
def full_address
 [street, city, state].compact.join(', ')
end



end
