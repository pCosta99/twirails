class Like < ApplicationRecord
  belongs_to :tweet, counter_cache: :like_count
  belongs_to :user

  validates :user, uniqueness: { scope: :tweet_id }
end
