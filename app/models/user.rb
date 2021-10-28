class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :followers, dependent: :destroy, foreign_key: 'followee_id'

  def list_of_followers
    Follower.where(followee_id: id).map do |f|
      User.find(f.follower_id)
    end
  end

  def list_of_following
    Follower.where(follower_id: id).map do |f|
      User.find(f.followee_id)
    end
  end
end
