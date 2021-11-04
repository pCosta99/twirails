# frozen_string_literal: true

class Follower < ApplicationRecord
  belongs_to :user, foreign_key: :follower_id, counter_cache: :follower_count

  def follower
    User.find(user_id)
  end
end
