class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweet_likes

  def liked?(user)
    tweet_likes.any? { |like| like.user_id == user.id }
  end
end
