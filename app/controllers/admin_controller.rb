class AdminController < ApplicationController
  helper_method :admin_signed_in?, :current_admin, :admin_session

  def index
    render 'index'

  protected
    before_action :authenticate_admin!
  end
end
