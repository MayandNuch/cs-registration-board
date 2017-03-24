class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    begin
      @teacher = Teacher.find(params[:id])
      @courses = @teacher.courses
      @course = current_teacher.courses.build if teacher_signed_in?
    rescue
      redirect_to root_url
    end
  end

  def destroy
    Teacher.find(params[:id]).destroy
    flash[:success] = "Teacher deleted"
    redirect_to request.referrer
  end
end
