class TweetLike < ApplicationRecord
  belongs_to :tweet, counter_cache: :tweet_like_count

  has_many :user
end
