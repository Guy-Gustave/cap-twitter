class LikesController < ApplicationController
  def create
    Like.create(opinion_id: params[:opinion_id], user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    @like = Like.find_user_like(current_user.id, params[:opinion_id])
    @like.destroy
    redirect_to root_path
  end
end
