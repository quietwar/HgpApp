class ClassroomsController < ApiController

respond_to :json
  def index
    @classrooms = Classroom.select("users_id").all
    render json: @classrooms.to_json

  end

  def show
    @classroom = Classroom.find(params[:id])
    render json: @classroom.to_json(:include => { :curriculums => { :only => [:id, :description] }})
  end

  def search
    @users = User.search_by_name(params[:search_name]).paginates_per(page: params[:page])
  end
end
