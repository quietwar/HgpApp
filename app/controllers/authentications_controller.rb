class AuthenticationsController< Devise::OmniauthCallbacksController

  def create
    auth = request.env[":google_oauth2"]
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])
    redirect_to root_url, :notice => "Signed in!"
    super do
        resource.project_list = params[:project]
        resource.save
    end
  end

  def signin
    warden.authenticate(params[:email], params[:password])
    render :json => current_user.to_json
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  #POST /resource/sign_in


  protected

  # def sign_up_params
  #   params.require(:user).permit(:first_name, :last_name, :city, :cohort_id, :email, :password, :password_confirmation, :project)
  # end


  # def project_params
  #   params.require(:project).permit(:app_name, :coding, :project_details, :start_date)
  # end
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  #
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #  devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(user_session_path)
   '/root_path/'
  end

end
