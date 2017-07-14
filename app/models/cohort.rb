class Cohort < ApplicationRecord

# belongs_to :admin
has_many :admin_cohorts
has_many :admins, through: :admin_cohorts
end
