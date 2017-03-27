class CoursesController < ApplicationController
  before_action :check_authenticated?, only: [:create, :destroy]

  def create
    @course = Course.create(course_params)
    if(teacher_signed_in?)
      @person = current_teacher
    else
      @person = current_admin
    end

    if @course.update_attribute(:user, @person)
      flash[:success] = "Course created!"
      if(current_teacher != nil)
        redirect_to current_teacher
      else
        redirect_to request.referrer || root_url
      end
    else
      flash[:error] = @course.errors.full_messages
      redirect_to request.referrer || root_url
    end

  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted"
    redirect_to request.referrer || root_url
  end

  def index
    @courses = Course.all
  end

  def show
    begin
      @course = Course.find(params[:id])
      @students = @course.students
      @comments = Comment.where(course:params[:id] )
      @comment = Comment.create
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
        redirect_to request.referrer || @course
      else
        redirect_to request.referrer || @course
      end
    end
    def update_course
      begin
        @course = Course.find(params[:id])
        if @course.update_attributes(coursename: params[:course][:coursename], instructor: params[:course][:instructor])
          flash[:success] = "Profile updated."
          redirect_to '/admins/manage_courses'
        else
          redirect_to   edit_course_path(@course)
        end

      rescue
        redirect_to root_url
      end
    end

  private

    def course_params
      params.require(:course).permit(:coursename,:instructor)
    end
    def check_authenticated?
      if current_admin || current_teacher || current_student

      else
        redirect_to root_url
      end
    end


end
