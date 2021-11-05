# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :tweet_liked?, only: [:flip_like]
  before_action only: %i[edit update destroy] do
    is_owner = current_user.id == params[:user_id].to_i
    exists = Tweet.exists?(params[:id].to_i)

    redirect_back(fallback_location: home_path) unless is_owner && exists
  end

  def edit
    @user = current_user
    @tweet = @user.tweets.find(params[:id]) or not_found
  end

  def show
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id]) or not_found
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
    Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])

    redirect_back(fallback_location: home_path)
  end

  def dislike
    Like.destroy_by(user_id: current_user.id, tweet_id: params[:tweet_id])

    redirect_back(fallback_location: home_path)
  end

  def flip_like
    @tweet_id = params[:tweet_id]
    @id = current_user.id
    @user = current_user

    if @tweet_liked
      Like.destroy_by(user_id: @id, tweet_id: @tweet_id)
    else
      Like.create(user_id: @id, tweet_id: @tweet_id)
    end
  end

  private

  def tweet_liked?
    @tweet_liked = Like.exists?(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
