class TweetsController < ApplicationController
  def index
    tweets = Tweet.by_user(search_params[:user_id])
  
    render json: tweets.all
  end
  
  def search_params
    params.permit(:user_id)
  end
end
