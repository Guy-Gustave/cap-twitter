class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:current_user] = user.id
      flash[:notice] = "user successfully Loged in"
      redirect_to root_path
    else
      flash[:alert] = 'There is no user with that name'
      render :new
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to new_user_path
  end
end
