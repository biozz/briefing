class Bot < ApplicationRecord
  has_and_belongs_to_many :briefing
  belongs_to :user

  include Rails.application.routes.url_helpers
  def publish(_brieifng_name, _feed_log)
    url = "https://api.telegram.org/bot#{token}/sendMessage"
    # summary = Kramdown::Document.new(_feed_log.summary, html_to_native: true).to_kramdown
    feed_log_url = Rails.application.routes.url_helpers.url_for(controller: 'feed_logs', action: 'show',
                                                                feed_id: _feed_log.feed_id, id: _feed_log.id)
    text = "#{_feed_log.title}
url: #{_feed_log.url}
rss-tg url: #{feed_log_url}
briefing: #{_brieifng_name}"
    response = HTTParty.post(url, { body: { chat_id: chat_id, text: text } })
    logger.debug response
  end
end
