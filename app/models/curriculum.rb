class Curriculum < ApplicationRecord
  has_many :lesson_plans, inverse_of: :curriculum
    accepts_nested_attributes_for :lesson_plans, allow_destroy: true
  # has_many :users, inverse_of: :cohort, autosave: true
  # accepts_nested_attributes_for :users, allow_destroy: true
  #   #before_save :run_before_add, after_add: :run_after_add
  # validates :cohort_number && :city, uniqueness: true, on: :create
  # has_many :projects, through: :users
  #   accepts_nested_attributes_for :projects, allow_destroy: true
  # has_many :attendances, through: :users
  #   accepts_nested_attributes_for :attendances, allow_destroy: true
  # has_many :cohort_users
   belongs_to :classroom

end
