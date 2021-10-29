class AddTweetLikeCountToTweetLike < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :tweet_like_count, :integer
  end
end
