class ClassroomsController < ApplicationController

    def index
      @classrooms = Classroom.all
      @users = User.paginates_per(:page => params[:per_page => 1])

    end

    # def show
    #   redirect_to root_path
    # end

    def search
      @search = params["search"]
      if @search.present?
        @name = @search["name"]
        @users = User.where("name ILIKE ?", "%#{@name}%")
     end
    end
  end
