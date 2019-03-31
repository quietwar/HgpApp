class AdminUsers::SessionsController < Devise::SessionsController
  #permit_params :first_name, :last_name, :city, :email, :email2, :avatar, :username, :cell, :title,

  # #GET /resource/sign_in
  # def new
  #   super
  # end

  #POST /resource/sign_in
  # def create
  #   super
  # en

  #DELETE /resource/sign_out
  # def destroy
  #   session[:user_id] = nil
  #   redirect_to admin_dashboard_path
  #   super
  # end
  #
  #
  # protected

  # def admin_user_params
  #      params.require(:admin_user).permit(:first_name, :last_name, :city, :email, :avatar, :username, :cell, :title,
  #      #params.permit(user: [ :first_name, :last_name, :city, :cohort, :email, :avatar, :username { projects: :app_name, :coding, :project_details, :start_date } ])
  # end

     #If you have extra params to permit, append them to the sanitizer.
  # def initialize(*)
  #   super
  #   permit(:sign_up, keys: [:username, :email])
  # end
end
