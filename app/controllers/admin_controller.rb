class AdminController < ApplicationController
  attr_accessor :extra_courses

  def index
    @courses = Course.all.to_json(include: [:students] ).to_s

  end

  def manage_courses
    @extra_courses = Course.all
  end

  def manage_instructors
    @teachers = Teacher.all
    # delete method is the build in what it does inside
  
    # add current_admin.courses.build if admin_signed_in?
  end


  # def show
  #   begin
  #     @admin = admin.find(params[:id])
  #   rescue
  #     redirect_to admin_path
  #   end
  # end
end
