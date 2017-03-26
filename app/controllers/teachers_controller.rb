class TeachersController < ApplicationController
  # def index
  #   @teachers = Teacher.all
  # end

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
    redirect_to request.referrer || root_url
  end

  def update_teacher
    begin
      @teacher = Teacher.find(params[:id])
      if @teacher.update_attributes(firstname: params[:teacher][:firstname], lastname: params[:teacher][:lastname], teacher_id: params[:teacher][:teacher_id])
        flash[:success] = "Profile updated."
        redirect_to '/admins/manage_instructors'
      else
        redirect_to   edit_instructor_admin_path(@teacher)
      end

    rescue
      redirect_to root_url
    end
  end
end
