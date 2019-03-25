class Attendance < ApplicationRecord
  belongs_to :user#, optional: true
  delegate :cohort, to: :user
  #has_many_a
  def initialize(attributes)
    puts 'attendance initializing'
    super(attributes)
  end

  after_initialize do
    puts 'after attendance initialization'
  end
end
