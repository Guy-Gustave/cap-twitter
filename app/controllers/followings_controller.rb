class FollowingsController < ApplicationController
  def create
    Following.create(Followerid: current_user.id, Followedid: params[:followed_id])
    redirect_to user_path(params[:followed_id])
  end

  def destroy
    @followings = Following.find_friend_to_unfollow(current_user.id, params[:followed_id])
    @followings.destroy
    redirect_to user_path(params[:followed_id])
  end
end
