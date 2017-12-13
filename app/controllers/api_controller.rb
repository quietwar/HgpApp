class ApiController < ApplicationController
  def signin
    warden.authenticate(params[:email], params[:password])
    render :json => current_user.to_json
  end
end
