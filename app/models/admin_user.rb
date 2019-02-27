class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  role_based_authorizable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

        attr_accessor :login
      #
      # validates_format_of :email, { with:/\b[A-Z0-9._%a-z\-]+@hiddengeniusproject.org\z/, message: "only allows HGP addresses" }
      # validates :first_name, presence: false
      # validates :last_name, presence: false


      # validates :provider, presence: false
      # validates :uid, uniqueness: false#{ scope: :provider }
    #  alias_attribute :Genius_Staff, :admin
     has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
     alias_method :comments, :active_admin_comments

    
       protected
     end
