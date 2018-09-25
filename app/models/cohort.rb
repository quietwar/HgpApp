class Cohort < ApplicationRecord

  has_many :classrooms
    accepts_nested_attributes_for :classrooms, allow_destroy: true
  has_many :users, inverse_of: :cohort
  accepts_nested_attributes_for :users, allow_destroy: true
    validates_uniqueness :genius
  #   after_save :genius
  #   belongs_to :user, presence: true
  #   validates :user, presence: true
end
