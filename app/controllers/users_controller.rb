class UsersController < ApplicationController
  def index
    @users=User.all
end
def sow
    @user=User.find(params[:id])
end
def new
    @user=User.new
end

def create
    @user=User.new(user_params)
    if @user.save
        redirect_to root_path
        flash[:notice] = "user has been successfully created"
        session[:current_user] = @user.id
    else
        render :new
        flash[:alert] = "we couldn't sign you up because of this reasons:"
    end
end

private
def user_params
    params.require(:user).permit(:username, :fullname,:photo,:cover_image)
end
end
