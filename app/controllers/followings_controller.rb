class FollowingsController < ApplicationController
  def create
    Following.create(follower_id: current_user.id, followed_id: params[:followed_id])
    redirect_to user_path(params[:followed_id])
  end

  def destroy
    @followings = Following.find_friend_to_unfollow(current_user.id, params[:follower_id])
    @followings.destroy
    redirect_to user_path(params[:followed_id])
  end
end
