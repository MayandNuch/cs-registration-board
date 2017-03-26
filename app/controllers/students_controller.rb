class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    begin
      @student = Student.find(params[:id])
      @courses = @student.courses
    rescue
      redirect_to root_url
    end
  end
end
