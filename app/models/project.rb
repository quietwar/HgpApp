class Project < ApplicationRecord

  belongs_to :user#, polymorphic: true#, inverse_of: :users
  #accepts_nested_attributes_for :user

  # has_many :user_projects
  # validates_presence_of :user
  # validates_uniqueness_of :app_name
  # alias_attribute :genius, :user
  # validates :app_name, :project_details, :coding, :github, :url, :authenticity_token, presence: false

  delegate :cohort, to: :user
  #has_many_a
  def initialize(attributes)
    puts 'project initializing'
    super(attributes)
  end

  after_initialize do
    puts 'after project initialization'
  end

end
