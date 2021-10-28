class TweetsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @tweet = @user.tweets.find(params[:id])
  end

  def update
    @user = current_user
    @tweet = @user.tweets.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @user = current_user
    @tweet = @user.tweets.create(tweet_params)

    redirect_to root_path
  end

  def destroy
    @user = current_user
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy

    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
