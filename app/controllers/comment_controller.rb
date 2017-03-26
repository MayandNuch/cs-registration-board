class CommentController < ApplicationController
  def create
    if current_teacher == nil && current_admin == nil && current_student == nil
      redirect_to new_student_session_path
    else
      @person = current_teacher = nil? current_admin == nil? current_student : current_admin : current_teacher
      @comment = Comment.create(courses_id:params[:id],email:@person.email,content:params[:comment][:content])
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
