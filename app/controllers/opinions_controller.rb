class OpinionsController < ApplicationController

  before_action :authorize, only: [:index]

  def index
    @opinion = Opinion.new
    @opinions = Opinion.order('created_at DESC').includes(:author).limit(5)
    @users = User.all_users(current_user.id).order('created_at DESC')
  end

  def create
    usr = User.find(check_user)
    @opinion = usr.opinions.build(opinion_params)
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

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
