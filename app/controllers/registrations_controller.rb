class RegistrationsController < Devise::RegistrationsController
   protected

      def sign_in_path_for(resource)
        '/sign_in' # Or :prefix_to_your_route
      end

      def after_sign_up_path_for(resource)
        ' /admins/cohorts' # Or :prefix_to_your_route
      end

  private

      def sign_up_params
        params.require(:user).permit( { roles: [] }, :first_name, :last_name, :email, :password, :password_confirmation)
      end

      def account_update_params
        params.require(:user).permit( { roles: [] }, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
      end

end
