# frozen_string_literal: true

class AddLikeCountToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :like_count, :integer
  end
end
