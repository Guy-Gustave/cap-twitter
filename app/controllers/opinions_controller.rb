class OpinionsController < ApplicationController
  before_action :authorize, only: [:index]

  def index
    @opinion = Opinion.new
    @opinions = post_opinions.includes(:auther).limit(4)
    @users = User.all_users(current_user.id).order('created_at DESC')
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.auther_id = current_user.id

    if @opinion.save
      flash[:notice] = 'Idea well created'
      redirect_to root_path
    else
      flash[:alert] = 'something went wrong'
      render 'index'
    end
  end

  private

  def post_opinions
    @post_opinions ||= Opinion.all.ordered_by_most_recent.includes(:user)
  end

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
