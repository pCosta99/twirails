class Tweet < ApplicationRecord
  belongs_to :user

  has_many :likes

  def liked?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
