class Feed < ApplicationRecord
  has_and_belongs_to_many :briefing
  has_many :feed_logs
  alias_attribute :logs, :feed_logs

  def get_entries
    xml = HTTParty.get(url).body
    Feedjira.parse(xml).entries.each do |_entry|
      next if logs.where(published_at: _entry.published).exists?

      logs.create(
        title: _entry.title,
        url: _entry.url,
        summary: _entry.summary,
        published_at: _entry.published
      )
    end
  end

  def to_s
    @name
  end
end
