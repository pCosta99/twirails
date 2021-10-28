class CreateFollowersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end

    add_index :followers, %i[follower_id followee_id], unique: true
  end
end
