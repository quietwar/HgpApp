class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :logged_in?

  def current_user
      @current_user ||= User.find_by(id: session[:user])
    end

    def logged_in?
      current_user != nil
    end

  private

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end

  helper_method :current_room, :current_admin
end



  def configure_permitted_parameters
     added_attrs = [:username, :first_name, :last_name, :email, :password, :password_confirmation, :avatar, :remember_me]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
#end
