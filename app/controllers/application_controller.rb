class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?

  private
  def current_user
    User.where(id: session[:user_id]).first
  end

  def user_signed_in?
    !!current_user
  end

  def authorize
    render new_session_path if !user_signed_in?
  end
end
