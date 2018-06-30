class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


   #with_options presence: true do
      #validates :email,
      validates_format_of :email, { with:/\b[A-Z0-9._%a-z\-]+@hiddengeniusproject.org\z/, message: "only allows HGP addresses" }
     # validates :provider, presence: false
     # validates :uid, uniqueness: false#{ scope: :provider }
      validates :first_name, presence: true
      validates :last_name, presence: true
    #  alias_attribute :Genius_Staff, :admin
    #  has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
    #  alias_method :comments, :active_admin_comments

    #  has_many :classrooms



     end
