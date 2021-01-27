namespace :sync do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      xml = HTTParty.get(feed.url)
      content = Feedjira.parse(xml)
      content.entries.each do |entry|
        p entry
      end
    end
  end
end
