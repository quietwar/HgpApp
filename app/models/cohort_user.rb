class CohortUser < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  self.primary_key = [:cohort_id, :user_id]
end
