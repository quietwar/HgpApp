class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,:omniauthable,
  devise :database_authenticatable,:registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, omniauth_providers: [:google_oauth2]
         attr_accessor :login
         attr_accessor :username, :email, :email2, :password, :password_confirmation, :remember_me, :login


   #with_options presence: true do
     validates :email2, presence: false
     validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
     validates :provider, presence: true
     validates :uid, uniqueness: { scope: :provider }
     validates :first_name, presence: true
     validates :last_name, presence: true
     has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
     alias_method :comments, :active_admin_comments
     geocoded_by :address
      after_validation :geocode


     has_many :cohort, :class_name => 'Admin_user::Cohort'
     has_many :users, :class_name => 'Admin_user::User'
     has_and_belongs_to_many :oauth_credentials
     has_many :friendships
     has_many :friends#, through: :friendships, class_name: "User"
     has_one :room
     has_many :classrooms
     has_many :features
     has_many :messages

    #end

    # Devise override to ignore the password requirement if the user is authenticated
        def google_oauth2
          @admin_user = Admin_User.create_from_google_data(request.env['omniauth.auth'])
          if @admin_user.persisted?
            sign_in_and_redirect @admin_user
            set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
          else
            flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
            redirect_to new_user_registration_url
          end
        end

        def password_required?
          return false if provider.present?
          super
        end

        def self.create_from_provider_data(provider_data)
            where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
              admin_user.email = provider_data.info.email
              admin_user.password = Devise.friendly_token[0, 20]
              admin_user.skip_confirmation!
            end
          end

          def from_omniauth(auth)
            admin_user = where(email: auth.info.email).first || where(auth.slice(:provider, :uid).to_h).first || new
            admin_user.tap { |this| this.update_attributes(provider: auth.provider, uid: auth.uid, email: auth.info.email) }
          end


       def self.find_for_database_authentication(warden_conditions)
         conditions = warden_conditions.dup
         login = conditions.delete(:login)
         where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
       end
    end
