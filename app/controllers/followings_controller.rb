class FollowingsController < ApplicationController
  before_action :check_user

    def followto
        user=User.find(check_user)
        @users=user.whotofollow
    end

    def follow
        @followings = Following.new(follower_id:check_user,followed_id:params[:user_id])
        if @followings.save
            redirect_to root_path
            flash[:notice] = "you followed"
        else
            render :new
            flash[:alert] = "something went wrong"
        end
    end
end
