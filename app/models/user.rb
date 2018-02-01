class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
      devise :registerable,:database_authenticatable, :confirmable,
             :recoverable, :rememberable, :trackable, :omniauthable #, omniauth_providers: [:google_oauth2]
             #validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
              validates :cohort_id, :city, presence: true
              validates :email, presence: true
              validates :password, presence: false #length: {:within => 6..46 }, on: :create
              validates :password_confirmation, presence: false #length: {:within => 6..40 }, on: :create
              has_attached_file :avatar, styles: { medium: '680x300>', thumb: '170x75>' }, default_url: '/assests/images/missing.png"'
                validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
              after_create :create_room
              geocoded_by :address
                after_validation :geocode

              has_one :room, inverse_of: :user
              has_one :cohort, inverse_of: :user
              has_many :projects, inverse_of: :user
              has_many :messages, inverse_of: :user
                accepts_nested_attributes_for :cohort, :room, :projects, :allow_destroy => true
              has_many :friendships, class_name: "Genius"
              has_many :active_admin_comments, as: :resource, class_name: 'Hgp_staffStaff::Comment'
              alias_method :comments, :active_admin_comments
              # belongs_to :cohort, inverse_of: :users
              #   validates_presence_of :cohort

      def full_name
        "#{first_name} #{last_name}"
      end

      def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(email: data['email']).first
          #Uncomment the section below if you want users to be created if they don't exist
          unless user
              user = User.create(name: data['name'],
                 email: data['email'],
                 password: Devise.friendly_token[0,20]
              )
          end
          user
      end

    def self.create_from_provider_data(provider_data)
       where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
         user.email = provider_data.info.email
         user.password = Devise.friendly_token[0, 20]
         user.skip_confirmation!

       end
     end

     def self.search_by_name(name)
        names_array = name.split(' ')

        if names_array.size == 1
          where('first_name LIKE ? or last_name LIKE ?',
            "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
        else
          where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ?
            or last_name LIKE ?', "%#{names_array[0]}%",
            "%#{names_array[1]}%", "%#{names_array[0]}%",
            "%#{names_array[1]}%").order(:first_name)
        end
      end

      def follows_or_same?(new_friend)
        friendships.map(&:friend).include?(new_friend) || self == new_friend
      end

      def current_friendship(friend)
        friendships.where(friend: friend).first
      end


      def refresh_token_if_expired
        if token_expired?
          response = RestClient.post "https://accounts.google.com/o/oauth2/token", :grant_type => 'refresh_token', :refresh_token => self.refresh_token, :client_id => ENV['GOOGLE_CLIENT_ID'], :client_secret => ENV['GOOGLE_CLIENT_SECRET']
          refreshhash = JSON.parse(response.body)

          access_token_will_change!
          oauth_expires_at_will_change!

          self.access_token = refreshhash['access_token']
          self.oauth_expires_at = DateTime.now + refreshhash["expires_in"].to_i.seconds

          self.save
          puts 'Saved'
        end
      end

      def token_expired?
        expiry = Time.at(self.oauth_expires_at)
        return true if expiry < Time.now
        token_expires_at = expiry
        save if changed?
        false
      end


      def after_sign_up_path_for(user)
        '/root_path/'
      end

      def avatar_attributes=(attributes)
         # Marks the attachment for destruction on next save,
         # if the attributes hash contains a _destroy flag
         # and a new avatar was not uploaded at the same time:
         avatar.clear if has_destroy_flag?(attributes) && !avatar.dirty?
       end


      private

      def sign_up_params
        params.require(:user).permit(:cohort, :avatar, :first_name, :last_name, :username, :genius, :city, :email, :email2, :cell, :password, :password_confirmation,)

      def account_update_params
        params.require(:user).permit(:avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :benchmark, :projects, :project, :project_ids
        )
      end


      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
      end

      def create_room
       hyphenated_username = self.full_name.split.join('-')
       Room.create(name: hyphenated_username, user_id: self.id)
      end

        # def create_room
        #   @user = :current_user
        #   @room = @user.create_room(params[:room].permit(:genius, :username))
        #   hyphenated_username = self.full_name.split.join('-')
        #   room.create(name: hyphenated_username, user_id: self.id)
  end
end
