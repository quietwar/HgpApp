class Users::ProjectsController < ApplicationController
  #before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]
  #before_action :project_params, only: [:create, :edit]
  helper_method :set_current_room, :current_user
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  def index
    @projects = Project.all
     :set_current_room
    #@projects =
    @friends = :friend_id
    @message = Message.new
    @messages = :current_room if :current_room
    @follower = Friendship.where(friend_id: :user_id)
    @friends = Friendship.all
  end



  def show
    #@project = Project(:project_id)
    #@friendship = Friendship(:user_id, @friends)
  end

  def new
    @project = :current_user.Project.new
  end

  #def create
      #@message = @current_user.messages.build(message_params)
      #@message.room = current_room

      # if @message.save
      #   respond_to do |format|
      #     format.html { redirect_to projects_path(current_user, roomId: current_room.id) }
      #     format.js { ActionCable.server.broadcast "messages_room_#{current_room.id}",
      #       render(partial: 'shared/message', object: @message ) }
    #     end
    #     flash[:notice] = "Comment has been created"
    #     redirect_to projects_path(current_user, roomId: current_room.id)
    #   end
    # end
  def create
    # @project = Project.where(params[:id])
    # @user.project.build(params[@user][@project.id])
    @project = Project.new
    @project.user = current_user

    respond_to do |format|
      if @project.save!
        format.html { redirect_to user_url(@project.user_id), notice: 'Project has been created' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
  end

  def update
    respond_to do |format|
    if @project.update(params)
      format.html { redirect_to user_url(@project.user_id), notice: 'Project has been updated'}
      format.json { render :show, status: :created, location: @project }
    else
      format.html { render :edit }
      format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@project.user_id), notice: "Project has been Deleted" }
      format.json { head :no_content }
    redirect_to user_projects_path(:user_id)
  end




protected

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def my_sanitizer
    params.require(:project).permit(:app_name, :coding, :project_details, :start_date)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_project
    @project = Project.find(params[id])
  end

  # def project_params
  #   params.require(:project).permit(:app_name, :user_id, :utf8, :commit, :coding, :project_details, :start_date, :url, :authenticity_token, :github, :locale)
  # end

  def set_current_room
    if params[:roomId]
      @room = Room.find_by(id: params[:roomId])
    else
      @room = current_user.room
    end
  end
    session[current_room] = @room.id if @room
  end
end
