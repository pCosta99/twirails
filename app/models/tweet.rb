class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweet_likes
end
