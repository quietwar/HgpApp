class CohortsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_cohort#, only: [:show, :edit, :update, :destroy]

    def index
      @cohort = Cohort.all
      @cohorts = current_user.cohorts
      set_current_class
    end

    def show
      @cohort = cohort.find(params[:cohort])
    end

    def new
      @cohort = Cohort.new
    end

    def create
      @cohort = Cohort.new(cohort_params)
      if @cohort.save
        flash[:notice] = "Cohort has been created"
        redirect_to [current_user, @cohort]
      else
        flash.now[:alert] = "Cohort has not been created"
        render :new
      end
    end

    def destroy

    end

    private

    def set_cohort
      @cohort = current_user.cohorts.find params[:id]
    end

    def cohort_params
      params.require(:cohort).permit(:cohort_id)
    end

    def set_current_class
      if params[:roomId]
        @class = Class.find_by(id: params[:classId])
      else
        @class = current_user.class
      end
      session[:current_class] = @class.id if @class
    end

end
