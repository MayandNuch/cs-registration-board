class AdminsController < ApplicationController
  attr_accessor :extra_courses

  def index
    @courses = Course.all.to_json(include: [:students] ).to_s

  end

  def manage_courses
    @extra_courses = Course.all
  end

  def manage_instructors
    @teachers = Teacher.all
  end
  def edit_course
    @course = Course.find(params[:id])
  end

  def edit_instructor
    @teacher = Teacher.find(params[:id])
  end
  # def show
  #   begin
  #     @admin = Admins.find(params[:id])
  #   rescue
  #     redirect_to admins_path
  #   end
  # end
end
