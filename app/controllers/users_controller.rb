class UsersController < Devise::RegistrationsController
respond_to :html, :json
# require 'google/api_client'
# require 'google/api_client/client_secrets'
before_action :set_cohort


  def new
    @user = @cohort.users.new
    @user.attendances.build
  end

  def create
    @user = @cohort.users.build(user_params)
    if @user.save
      redirect_to @cohort
    else
        format.html { redirect_to
        edit_user_first_path(@user),
        notice: "User created! Now select or create a cohort."}
      #
      #   format.html { render :new }
      #   format.json { render json: @user.errors, status:
      #     :unprocessable_entity}
      # end
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @cohort = @user.build_cohort
  end


  def show
    @user = User.find(params[:user_id])
    byebug
    @cohort = @user.cohort
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def index
     @users = User.cohort.where(params[:cohort_id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update!(user_params)
        @cohort = @user.cohort
        format.html { redirect_to @cohort,
        notice: "User updated!"}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status:
          :unprocessable_entity}
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end



 private

 def set_cohort
   @cohort = Cohort.find(params[:cohort_id])
 end

 def create_login
    email = self.email.split(/@/)
    login_taken = User.where(login: email[0]).first
    self.login =
    if login_taken
      self.email
    else
      email[0]
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :avatar, :cohort_number, :city, :username, :email, :password, :avatar, :email2,
      attendance_attributes: [
        :starts_at,
        :ends_at,
        :DateTime,
        :_destroy
      ]
    ).merge(cohort: @cohort)
end

# def user_params
#     params.require(:user).permit(:name, :avatar, :cohort_number, :city, :username, :email, :password, :avatar, :email2)# project_attributes: [:app_name, :user_id, :coding, :github, :url, :project_details, :start_date])
#   end

  # def user_params
  #   params.require(:cohorts).permit(:city, :cohort_number, user_attributes: [:name, :username, :genius, :cohort_number, :city, :email, :email2, :cell, :stipend, :project], attendances_attributes: [:class_date, :absent,  :present, :halfday])
  # end

  def project_params
    params.require(:project).permit(:authenticity_token, :github, :locale)
  end

  def self.find_for_database_authentication conditions
      where(login: conditions[:email]).first || where(email: conditions[:email]).first
  end

   def authenticate_user!
      unless current_user
         flash[:alert] = "Unauthorized Access: Genius, try again!"
         redirect_to root_path
       end
    end
end
