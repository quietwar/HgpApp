class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  role_based_authorizable
  devise :database_authenticatable,
<<<<<<< HEAD
         :recoverable, :rememberable, :trackable

        # Setup accessible (or protected) attributes for your model
        attr_accessor :email, :password, :password_confirmation, :remember_me

=======
         :recoverable, :rememberable, :trackable, :validatable
>>>>>>> activeadmin
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

      has_many :classrooms


       protected

<<<<<<< HEAD
       def self.find_for_database_authentication(warden_conditions)
         conditions = warden_conditions.dup
         login = conditions.delete(:login)
         where(conditions).where(["lower(email) = :value", { :value => login }]).first
       end
=======
       # def self.find_for_database_authentication(warden_conditions)
       #   conditions = warden_conditions.dup
       #   login = conditions.delete(:login)
       #   where(conditions).where(["lower(email) = :value", { :value => login }]).first
       # end
>>>>>>> activeadmin
     end
