# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :followers, dependent: :destroy, foreign_key: 'user_id'
  has_many :tweet_likes, dependent: :destroy

  def list_of_followers
    Follower.where(user_id: id).map(&:user)
  end

  def list_of_following
    Follower.where(follower_id: id).map(&:follower)
  end

  def following_count
    Follower.where(follower_id: id).count
  end

  def follower_count
    followers.count
  end
end
