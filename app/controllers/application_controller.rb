class ApplicationController < ActionController::Base
  def logged_in
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_user
    session[:current_user]
  end
end
