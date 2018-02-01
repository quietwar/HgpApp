class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :email, format: { with: /\.org\z/, message: "only allows HGP addresses" }
         alias_attribute :staff, :admin

         has_many :projects
         has_many :friendships
         has_many :friends, through: :friendships, class_name: "User"
         has_one :room
         has_many :cohorts
         has_many :classrooms
         has_many :features
         has_many :messages

    def full_name
           [first_name, last_name].join(" ")
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
end
