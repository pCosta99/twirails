class TimelineController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    timeline_sources = @user.list_of_following << @user
    @all_tweets = timeline_sources.map(&:tweets).select(&:exists?).flatten
  end
end
