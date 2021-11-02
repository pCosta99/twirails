class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, length: { minimum: 5 }

  def liked?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  def owned?(user)
    user_id == user.id
  end

  def time
    hour_diff = ((Time.now - updated_at) / 3600).round
    hour_diff > 24 ? updated_at.strftime('%b %d') : "#{hour_diff}h"
  end
end
