class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @my_profile = current_user == @user
    @following = @user.followers.exists?(follower_id: current_user.id)
  end

  def follow
    @user = User.find(params[:id])
    Follower.create!(follower_id: current_user.id, followee_id: @user.id) unless current_user == @user
    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    Follower.destroy_by(follower_id: current_user.id, followee_id: @user.id) unless current_user == @user
    redirect_to @user
  end
end
