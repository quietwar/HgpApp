class AttendancesController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :attendance_params, only: [:create, :edit]
  before_action :configure_permitted_parameters, if: :devise_controller? #:present, :absent, :user_id, :halfday, :class_date


  def new
    @attendance = Attendance.new
  end

  def index
    @attendance = Attendance.all

  def create
    @attendance = attendance.new(attendance_params)
    #@message.room = :current_room@attendances = Attendance.new(attendance_params)
    # student = Student.find(attendance_params[:student_id])
    # redirect_to new_attendances_path, notice: "#{student.name} attended class today."


    if @attendance.save
      respond_to do |format|
        flash[:notice] = 'attendance was successfully created'
        format.html { redirect_to classroom_attendances_path }
        format.json { render :show, status: :created, location: @attendance }
      end
        format.html { render :new }
        format.json { render json: @attendance.errors,
          status: :unprocessable_entity }
        end
      end
    #end
  def edit
    @classroom = Classroom.find(:classroom_id)
  end

  def update
  end

#private

  def configure_permitted_parameters
       attributes = [:first_name, :last_name, :username, :users_id, :class_date, :cohort, :cohort_id, :city_id, :present, :absent, :halfday]
       devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :email, :password, :password_confirmation])
       devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
       devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def project_params
    params.permit(:present, :absent, :user_id, :halfday, :class_date)
  end
end
end
