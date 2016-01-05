class GoalsController < ApplicationController
  before_action :ensure_signed_in
  before_action :ensure_goal_owner, only: [:edit, :update, :destroy]

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

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(@goal.user)
  end


  private
  def goal_params
    params.require(:goal).permit(:title, :description, :private?, :complete?)
  end

  def ensure_goal_owner
    goal = Goal.find(params[:id])
    unless goal.user == current_user
      redirect_to goal_url(goal)
    end
  end

end
