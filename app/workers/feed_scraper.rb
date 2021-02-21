require 'sidekiq-scheduler'

class FeedScraper
  include Sidekiq::Worker

  def perform
    Feed.all.each do |feed|
      feed.get_entries
    end
  end
end
