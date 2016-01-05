class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :ensure_signed_in

  def sign_in!(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def sign_out!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  private
  def ensure_signed_in
    unless signed_in?
      flash[:errors] = ["You must sign in first!"]
      redirect_to new_session_url
    end
  end
end
