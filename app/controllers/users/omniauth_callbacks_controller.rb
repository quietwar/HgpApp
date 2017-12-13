class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
<<<<<<< HEAD
  def google_oauth2
    byebug
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], :current_user)
    if @user.persisted? flash[:notice] = I18n.t("devise.omniauth_callbacks.success"), :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
=======

 def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])
      #   @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
>>>>>>> 953703d3ca0a5d21984e53c1d444c50ab07d2b44

    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
      return
    end
  end

<<<<<<< HEAD
=======
  def self.from_omniauth(access_token)
     data = access_token.info
     user = User.where(email: data['email']).first

     # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
     end
     user
 end
>>>>>>> 953703d3ca0a5d21984e53c1d444c50ab07d2b44
  # GET|POST /resource/auth/google
  def passthru
    super
    render status: 404, plain: "Not found. Authentication passthru."
  end
  #
  # GET|POST /users/auth/google/callback
  def failure
      redirect_to root_path
      return
    super
  end

  protected

  # #The path used when OmniAuth fails
   def after_omniauth_failure_path_for(scope)
        redirect_to root_path
        return
     super(:user)
    end
  end
