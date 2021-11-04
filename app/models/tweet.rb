# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_rich_text :body

  # custom validation (Note the singular validate, not the pluralized validations)
  validate :post_body_cant_be_empty

  def liked?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  def owned?(user)
    user_id == user.id
  end

  def time
    diff = Time.now - updated_at
    hour_diff = (diff / 3600).round
    hour_diff > 24 ? updated_at.strftime('%b %d') : time_suffix(diff)
  end

  private

  # custom model validation to ensure the post body that Action Text uses is not empty
  def post_body_cant_be_empty
    errors.add(:body, "can't be empty") if body.blank?
  end

  # This method is responsible for choosing between displaying
  # the time passed as hours/minutes/seconds when less than 24h have passed
  def time_suffix(time)
    # Less than 1 minute
    if time < 60
      "#{time.round}s"
    # Less than 1 hour
    elsif time < 3600
      "#{(time / 60).round}m"
    else
      "#{(time / 3600).round}h"
    end
  end
end
