class CoursesController < ApplicationController
  before_action :authenticate_teacher!, only: [:create, :destroy]
  def create
    @course = current_teacher.courses.build(course_params)
    if @course.save
      flash[:success] = "Course created!"
      redirect_to current_teacher
    else
      redirect_to root_url
    end
  end

  def destroy
    @course.destroy
    flash[:success] = "Course deleted"
    redirect_to request.referrer || current_teacher
  end

  def index
    @courses = Course.all
  end

  def show
    begin
      @course = Course.find(params[:id])
      @students = @course.students
    rescue
      redirect_to courses_path
    end
  end

  private

    def course_params
      params.require(:course).permit(:coursename,:instructor)
    end


end
