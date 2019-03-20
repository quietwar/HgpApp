class CohortUser < ApplicationRecord
  belongs_to :user
  belongs_to :cohort
end
