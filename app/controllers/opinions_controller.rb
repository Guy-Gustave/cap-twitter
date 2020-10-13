class OpinionsController < ApplicationController
  before_action :check_user
  def show
      @opinions = Opinion.find(params[:id])
  end
  def index
      user=User.find(check_user)
      @opinions= followedopinion(user)
  end
  def new
      @opinion = Opinion.new
  end

  def create
      user=User.find(check_user)
      @opinion=user.opinions.build(opinions_params)
      if @opinion.save
          redirect_to root_path
          flash[:notice] = "your news has been published"
      else
          render :new
          flash[:alert] = "something went wrong"
      end
  end

  private
  def opinions_params
      params.require(:opinion).permit(:text)
  end

  def followedopinion(user)
      followeds = user.followers.pluck(:followed_id).push(check_user)
      opinion = opinion.where(author_id: followeds).ordered_by_most_recent
  end

  
end
