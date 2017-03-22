class AdminController < ApplicationController
  attr_accessor :extra_courses

  def index
    @courses = Course.all.to_json(include: [:students] ).to_s

  end
  def manage_courses
    @extra_courses = Course.all
  end
  #
  # def show
  #   begin
  #     @admin = admin.find(params[:id])
  #   rescue
  #     redirect_to admin_path
  #   end
  # end
end
