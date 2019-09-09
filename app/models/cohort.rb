class Cohort < ApplicationRecord

  has_many :classrooms, inverse_of: :cohort
    accepts_nested_attributes_for :classrooms, allow_destroy: true
  has_many :users, through: :cohort_users#inverse_of: :cohort, autosave: true
  accepts_nested_attributes_for :users, allow_destroy: true
    #before_save :run_before_add, after_add: :run_after_add
  validates :cohort_number && :city, uniqueness: true, on: :create
  has_many :projects, through: :users
    accepts_nested_attributes_for :projects, allow_destroy: true
  has_many :attendances, through: :users
    accepts_nested_attributes_for :attendances, allow_destroy: true
  has_many :cohort_users
  has_many :user_infos, through: :users

  def self.test
    @cohort = Cohort.first

    # Excuse the poor test parameters -- I set up a bare Rails project and
    # did not define any columns, so created_at and updated_at was all I
    # had to work with
    user_params =
      {
        created_at: 'now',
        attendance_attributes: [{created_at: 'test'}]
      }

    # Let's trigger the chain of initializations/callbacks
    puts 'Running initialization callback test:'
    @cohort.users.build(user_params)
  end

  # Runs before parent object is added to this instance's #parents
  # def run_before_add(user)
  #   puts "before adding user to cohort"
  # end
  #
  # # Runs after parent object is added to this instance's #parents
  # def run_after_add(user)
  #   puts 'after adding user to cohort'
  # end
end
