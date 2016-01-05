class UserCommentsController < ApplicationController
  before_action :ensure_signed_in

  def create
    @user_comment = current_user.authored_user_comments.new(comment_params)
    @user_comment.save
    flash[:errors] = @user_comment.errors.full_messages
    redirect_to user_url(@user_comment.user_id)
  end

  private
  def comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end

end
