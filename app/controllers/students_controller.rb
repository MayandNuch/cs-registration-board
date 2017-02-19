class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  
  def show
    begin
      @student = Student.find(params[:id])
    rescue
      redirect_to students_path
    end
  end
end
