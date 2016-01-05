class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.validate_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      sign_in!(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = ["Invalid login info"]
      render :new
    end
  end


end
