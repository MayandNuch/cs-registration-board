class CommentController < ApplicationController
  def create
    if current_teacher == nil && current_admin == nil && current_student == nil
      redirect_to new_student_session_path
    else
      if current_teacher != nil
        @person = current_teacher
      elsif current_admin != nil
        @person = current_admin
      else
        @person = current_student
      end
      @course = Course.find(params[:id])
      @comment = @course.comments.create(course:@course,content:params[:comment][:content],commentor: @person)
      if @comment.save
        flash[:success] = "Comment created!"
        redirect_to request.referrer || root_url
      else
        flash[:error] = @comment.errors.full_messages
        redirect_to request.referrer || root_url
      end
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end



end
