class Project < ApplicationRecord

  belongs_to :user, inverse_of: :projects
  has_many :user_projects
  validates_presence_of :user
  validates_uniqueness_of :app_name
  alias_attribute :genius, :user


  validates :app_name, :project_details, :coding, :github, :url, :authenticity_token, presence: false



end
