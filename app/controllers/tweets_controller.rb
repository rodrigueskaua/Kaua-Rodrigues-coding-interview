class TweetsController < ApplicationController
  def index
    page = params[:page]&.to_i || 1
    per_page = params[:per_page]&.to_i || 5
    
    tweets = Tweet.by_user(search_params[:user_id])
                  .offset((page - 1) * per_page)
                  .limit(per_page)
                  .order(created_at: :asc)

    render json: tweets.all
  end
  
  def search_params
    params.permit(:user_id)
  end
end
