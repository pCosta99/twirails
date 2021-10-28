class Follower < ApplicationRecord
  belongs_to :user, foreign_key: :follower_id

  after_create do |f|
    unless Follower.find_by(follower_id: f.followee_id, followee_id: f.follower_id)
      Follower.create!(follower_id: f.followee_id, followee_id: f.follower_id)
    end
  end

  after_destroy do |f|
    mutual = Follower.find_by(follower_id: f.followee_id, followee_id: f.follower_id)
    mutual&.destroy
  end
end
