require 'sidekiq-scheduler'

class BriefingPublisher
  include Sidekiq::Worker

  def perform
    now = DateTime.now
    briefings = Briefing.where(next_run_at: ..now)
    briefings.each do |b|
      b.publish now
    end
  end
end
