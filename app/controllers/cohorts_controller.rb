class CohortsController < ApplicationController
  before_action :set_cohort


    def index
      @cohort = Cohort.all
    end

    def show
      @cohort = Cohort.find_by_id(cohort_params[:cohort_id])

    end

    def new
      @cohort = Cohort.new
      @cohort.users.build
    end

    def create
      @cohort = Cohort.new(cohort_params)
      Cohort.first.create_user(user_params) ?

      respond_to do |format|
        if @cohort.save #add_user_users
          format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
          format.json { render :show, status: :created, location: @cohort }
        else
          format.html { render :new }
          format.json { render json: @cohort.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @cohort = Cohort.find(cohort_params[:id])
      @user = @cohort.build_cohort
    end

    def destroy

    end

    private

    def set_cohort
      @cohort = Cohort.find_by(cohort_params[:id])
    end

    def cohort_params
      params.permit(:city, :cohort_id, :cohort_number, user_attributes: [:name, :cohort_id, :username, :genius, :email, :email2, :password, :cell, :project], attendances_attributes: [:class_date, :absent, :present, :halfday])
    end

    def add_user
         @cohort = Cohort.new
         @cohort.users.build
         render "add_Genius", :layout => false
    end

    def set_current_room
      if params[:roomId]
        @class = Class.find_by(id: params[:classId])
      else
        @class = current_admin.room
      end
      session[:current_class] = @class.id if @class
    end

end
