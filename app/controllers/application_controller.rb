class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  private

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end

  helper_method :current_room
end



  def configure_permitted_parameters
     added_attrs = [:username, :email, :password, :password_confirmation, :avatar, :remember_me]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
#end
