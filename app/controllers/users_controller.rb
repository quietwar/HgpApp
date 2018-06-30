class UsersController < Devise::RegistrationsController
# require 'google/api_client'
# require 'google/api_client/client_secrets'


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save!
        format.html { redirect_to
        edit_user_first_path(@user),
        notice: "User created! Now select or create a cohort."}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status:
          :unprocessable_entity}
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @cohort = @user.build_cohort[:id]
  end


  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def index
     @users = User.excludes(:id => current_user.id)
     @user = User.find(params[:id])
     @cohort = @user.build_cohort[:id]
     # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
     #    marker.lat user.latitude
     #    marker.lng user.longitude
     #    marker.title user.title
     # end
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
    params.require(:user).permit(:genius, :email, :password, :avatar, :email2, cohort_attributes: [:city, :cohort_id])
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
