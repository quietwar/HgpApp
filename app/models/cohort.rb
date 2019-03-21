class Cohort < ApplicationRecord

  has_many :classrooms, inverse_of: :cohort
    accepts_nested_attributes_for :classrooms, allow_destroy: true
  has_many :users, inverse_of: :cohort
    accepts_nested_attributes_for :users, allow_destroy: true
    validates_uniqueness :genius
  has_many :projects, through: :users
    accepts_nested_attributes_for :projects, allow_destroy: true
  has_many :attendances, through: :users
    accepts_nested_attributes_for :attendances, allow_destroy: true
  has_many :cohort_users
  #   after_save :genius
  #   belongs_to :user, presence: true
  #   validates :user, presence: true
end
