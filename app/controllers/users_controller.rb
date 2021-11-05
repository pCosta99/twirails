# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: %i[show follow unfollow followers following]

  def index
    @users = User.all
  end

  def show
    @my_profile = current_user == @user
    @following = @user.followers.exists?(follower_id: current_user.id)
    @tweets = @user.tweets.sort_by(&:updated_at).reverse
  end

  def follow
    Follower.create!(follower_id: current_user.id, user_id: @user.id) unless current_user == @user
    redirect_to @user
  end

  def unfollow
    Follower.destroy_by(follower_id: current_user.id, user_id: @user.id) unless current_user == @user
    redirect_to @user
  end

  def followers
    @followers = @user.list_of_followers
  end

  def following
    @following = @user.list_of_following
  end

  private

  def load_user
    @user = User.find { |u| u.email.split('@').first == params[:name] }
  end
end
