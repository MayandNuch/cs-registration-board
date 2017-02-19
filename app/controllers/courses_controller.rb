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
    Course.find(params[:id]).destroy
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

  def add_student
     @student = current_student
     @course = Course.find(params[:id])
     if @student.courses.exists?(@course)
       redirect_to @course
     else
       @student.courses << @course
       redirect_to @course
     end
   end

   def delete_student
      @student = current_student
      @course = Course.find(params[:id])
      if @student.courses.exists?(@course)
        @student.courses.delete(@course)
        redirect_to @course
      else
        redirect_to @course
      end
    end

  private

    def course_params
      params.require(:course).permit(:coursename,:instructor)
    end


end
