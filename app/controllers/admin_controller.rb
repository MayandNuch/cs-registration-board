class AdminController < ApplicationController
  def index
    # @admins = Admin.all
    # ActiveRecord::Base.inclue_root_in_json = false
    @courses = Course.all.to_json(include: [:students] ).to_s
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
