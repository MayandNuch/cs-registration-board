class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    begin
      @teacher = Teacher.find(params[:id])
    rescue
      redirect_to teachers_path
    end
  end
end
