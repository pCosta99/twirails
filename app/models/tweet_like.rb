class TweetLike < ApplicationRecord
  belongs_to :tweet, counter_cache: :tweet_like_count
  belongs_to :user

  validates :user, uniqueness: { scope: :tweet_id }
end
