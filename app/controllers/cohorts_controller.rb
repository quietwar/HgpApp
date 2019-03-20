class CohortsController < ApplicationController
  before_action :set_cohort


    def index
      @cohort = Cohort.all
      # @cohorts = current_admin.cohorts
      #
      #   respond_to do |format|
      # format.html
      # format.json { render json: UsersDatatable.new(view_context) }
      # end
    end

    def show
      @cohort = Cohort.find_by_id(params[:cohort_id])

    end

    def new
      @cohort = Cohort.new
    end

    def create
      @cohort = Cohort.new(cohort_params)
      respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
     end
    end

    def edit
      @cohort = Cohort.find(params[:id])
      @user = @cohort.build_cohort
    end

    def destroy

    end

    private

    def set_cohort
      @cohort = cohort_path(:admin_user_id)
    end

    def cohort_params
      params.require(:cohorts).permit(:city, :cohort_number, user_attributes: [:first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend, :project], attendances_attributes: [:class_date, :absent,  :present, :halfday])
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
