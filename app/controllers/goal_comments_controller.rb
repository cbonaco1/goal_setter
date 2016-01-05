class GoalCommentsController < ApplicationController
  before_action :ensure_signed_in

  def create
    @goal_comment = current_user.authored_goal_comments.new(comment_params)
    @goal_comment.save
    flash[:errors] = @goal_comment.errors.full_messages
    redirect_to goal_url(@goal_comment.goal_id)
  end

  private
  def comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end
end
