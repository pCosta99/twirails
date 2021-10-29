class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action only: %i[edit update destroy] do
    is_owner = current_user.id == params[:user_id].to_i
    exists = Tweet.exists?(params[:id].to_i)

    redirect_back(fallback_location: home_path) unless is_owner && exists
  end

  def edit
    @user = current_user
    @tweet = @user.tweets.find(params[:id])
  end

  def update
    @user = current_user
    @tweet = @user.tweets.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to home_path
    else
      render :edit
    end
  end

  def create
    @user = current_user
    @tweet = @user.tweets.create(tweet_params)

    redirect_to home_path
  end

  def destroy
    @user = current_user
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy

    redirect_to home_path
  end

  def like
    Like.create(user_id: current_user.id, tweet_id: params[:id])

    redirect_back(fallback_location: home_path)
  end

  def dislike
    Like.destroy_by(user_id: current_user.id, tweet_id: params[:id])

    redirect_back(fallback_location: home_path)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
