class Briefing < ApplicationRecord
  enum period: %i[hourly daily weekly monthly]
  has_and_belongs_to_many :feeds
  belongs_to :bot
  belongs_to :user

  def publish(_publish_at)
    logger.debug "processing: #{name} #{last_run_at}"
    offset = 1.hour if hourly?
    offset = 1.day if daily?
    offset = 1.week if weekly?
    offset = 1.month if monthly?

    new_next_run_at = next_run_at + offset * interval

    feeds.each do |_feed|
      logger.debug "working on #{_feed.name}"
      _feed.logs.where(published_at: last_run_at..next_run_at).each do |feed_log|
        bot.publish name, feed_log
      end
    end

    update(
      next_run_at: next_run_at + offset * interval,
      last_run_at: _publish_at
    )
  end
end
