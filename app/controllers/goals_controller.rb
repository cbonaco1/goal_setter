class GoalsController < ApplicationController
  before_action :ensure_signed_in

  def index

  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end


  private
  def goal_params
    params.require(:goal).permit(:title, :description, :private?)
  end

end
