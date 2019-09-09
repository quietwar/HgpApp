class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  include NormalizeBlankValues
  NORMALIZABLE_ATTRIBUTES = %i(email)
      devise :registerable,:database_authenticatable,:validatable,
             :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]#, :authentication_keys => {email: true, login: true}
              #validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
              validates_format_of :username, with: /\A[@\w\-\.]+\z/,
                                               allow_blank: true,
                                               message: "should only contain letters, numbers, or .-_@"
              validates_format_of :email, { with:/\b[A-Z0-9._%a-z\-]+@hgs.hiddengeniusproject.org\z/, message: "only allows HGP addresses" }
              validates_uniqueness_of :username, allow_blank: true
              # validates :password, presence: true, length: {:within => 6..46 }, on: :create
              # validates :password_confirmation, presence: true, length: {:within => 6..40 }, on: :create
              has_one_attached :avatar#, styles: { medium: '680x300>', thumb: '170x75>' }, default_url: '/assests/images/missing.png"'
                #validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
              after_create :create_room
              after_create :create_cohort
              #attr_accessor :login
              has_one :room, dependent: :destroy
              has_many :projects, inverse_of: :user
                       #before_save :run_before_add, after_add: :run_after_add
              accepts_nested_attributes_for :projects, allow_destroy: true
              has_many :messages, dependent: :destroy
              has_many :friendships#, class_name: "Genius"
              has_many :user_infos
              has_many :cohort_users
              has_one :cohort, through: :cohort_users# optional: true#, polymorphic: true

              #validates :cohort, presence: true
              has_one :cohort#, inverse_of: :user
              COHORT_TYPES = %w(Domain Service)

              # belongs_to :classroom, inverse_of: :users
              #   validates_presence_of :cohort_id
              has_many :attendances, inverse_of: :user
                      #  before_save  :run_before_add, after_add:  :run_after_add
              accepts_nested_attributes_for :attendances, reject_if: :all_blank, allow_destroy: true


      def build_cohort(params)
        raise "Unknown cohort_type: #{cohort_type}" unless COHORT_TYPES.include?(cohort_type)
        self.cohort = cohort_type.constantize.new(params)
      end

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

     # def self.search_by_name(name)
     #    names_array = name.split(' ')
     #
     #    if names_array.size == 1
     #      where('first_name LIKE ? or last_name LIKE ?',
     #        "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
     #    else
     #      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ?
     #        or last_name LIKE ?', "%#{names_array[0]}%",
     #        "%#{names_array[1]}%", "%#{names_array[0]}%",
     #        "%#{names_array[1]}%").order(:first_name)
     #    end
     #  end

      def follows_or_same?(new_friend)
        friendships.map(&:friend).include?(new_friend) || self == new_friend
      end

      def current_friendship(friend)
        friendships.where(friend: friend).first
      end

      def self.from_omniauth(auth)
        byebug
        user.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name   # assuming the user model has a name
          user.image = auth.info.image # assuming the user model has an image
        end
      end



        def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
            #byebug
            data = access_token.info
            user = User.where(:google_oauth2 => access_token.provider, :uid =>     access_token.uid ).first

            unless user
              #registered_user = User.where(:email => access_token.info.email).first

              #if registered_user
              #  return registered_user
              #else
                user = User.create(
                  name: data["genius"],
                  provider: access_token.provider,
                  email: data["email"],
                  uid: access_token.uid ,
                  password: Devise.friendly_token[0,20],
                )
              #end

           end

           user
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

       def initialize(attributes)
          puts 'user initializing'
          super(attributes)
        end

        after_initialize do
          puts 'after parent initialization'
        end

        # Runs before child object is added to this instance's #children
        def run_before_add(attendance)
          puts 'before adding attendance'
        end

        # Runs after child object is added to this instance's #children
        def run_after_add(attendance)
          puts 'after adding attendance'
        end

    protected

        def self.send_reset_password_instructions attributes = {}
          recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
          recoverable.send_reset_password_instructions if recoverable.persisted?
          recoverable
        end

        def self.find_recoverable_or_initialize_with_errors required_attributes, attributes, error = :invalid
          (case_insensitive_keys || []).each {|k| attributes[k].try(:downcase!)}

          attributes = attributes.slice(*required_attributes)
          attributes.delete_if {|_key, value| value.blank?}

          if attributes.size == required_attributes.size
            if attributes.key?(:login)
              login = attributes.delete(:login)
              record = find_record(login)
            else
              record = where(attributes).first
            end
          end

          unless record
            record = new

            required_attributes.each do |key|
              value = attributes[key]
              record.send("#{key}=", value)
              record.errors.add(key, value.present? ? error : :blank)
            #end
          end
          record
        end

        def self.find_record login
          where(["username = :value OR email = :value", {value: login}]).first
        end

    private

    # def create_cohort
    #   hyphenated_username = self.full_name.split.join('-')
    #   Cohort.create(name: hyphenated_username, user_id: self.id)
    # end

    # def create_room
    #     hyphenated_username = self.full_name.split.join('-')
    #     Room.create(name: hyphenated_username, user_id: self.id)
    #   end
    end
end
