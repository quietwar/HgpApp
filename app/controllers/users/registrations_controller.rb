class Users::RegistrationsController < Devise::RegistrationsController
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
     accepts_nested_attributes :project
    before_action :configure_permitted_parameters, if: :devise_controller?
     #params.permit(:projects => [ :app_name => [], :coding => [], :project_details => [], :start_date)

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = "user has been created"
        redirect_to [:current_user]
      else
        flash.now[:alert] = "user has not been created"
        render :new
      end
    end


   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_in, keys: [:avatar, :first_name, :last_name, :username, :city, :email, :email2, :cell, :password, :email, :password_confirmation])
   end
  #
  #
  #
  #  def sign_up_params
  #    params.require(:user).permit(:first_name, :last_name, :city, :cohort, :email, :password, :password_confirmation)
  #  end
  # # # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name, :username, :city, :email, :email2, :cell, :password, :email, :password_confirmation])
  end
  # #
  # # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
  private

  def sign_up_params
    params.require(:user).permit(:cohort, :avatar, :first_name, :last_name, :username, :genius, :city, :email, :email2, :cell, :password, :password_confirmation,)

  def account_update_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :benchmark, :projects, :project, :project_ids
    )
  end
  #
  # The path used after sign up.
  def after_sign_up_path_for(user)
    '/root_path/'
  end
  #
  # # The path used after sign up for inactive accounts.
  # # def after_inactive_sign_up_path_for(resource)
  # #   super(resource)
  # # end
end
