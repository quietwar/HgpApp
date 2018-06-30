class Event < ApplicationRecord
  has_many :schedules
  accepts_nested_attributes_for :schedules, :allow_destroy => true

  validates :location, :address, :city, :state, :latitude, :longitude, presence: true



  def full_address
   [street, city, state].compact.join(', ')
  end
end
