# frozen_string_literal: true

class RemoveBodyFromTweets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tweets, :body
  end
end
