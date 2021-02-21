class FeedLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feed

  def index
    @feed_logs = @feed.logs.order('published_at DESC')
  end

  def show
    @feed_log = FeedLog.where(feed: @feed, id: params[:id]).first
  end

  private

  def set_feed
    @feed = Feed.find(params[:feed_id])
  end
end
