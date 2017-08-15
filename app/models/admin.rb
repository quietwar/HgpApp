class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable
         attr_accessor :login

  has_many :admin_cohorts
  has_many :cohorts, through: :admin_cohorts

  rails_admin do
  
    end
end
