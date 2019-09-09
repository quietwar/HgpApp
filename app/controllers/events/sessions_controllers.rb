# class Admin::SessionsController < Devise::RegistrationsController
#   include Accessible
#   skip_before_action :check_user, only: :destroy
#
#   def after_sign_up_path_for(admin)
#       '/admin_dashboard_path/' # Or :prefix_to_your_route
#   end
#
#   def sign_up_params
#     params.require(:admin).permit(:first_name, :last_name, :title, :email, :password, :password_confirmation)
#   end
#
#   def account_update_params
#     params.require(:admin).permit(:first_name, :last_name, :title, :email, :password, :password_confirmation, :current_password)
#   end
