class CreateFeedLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :feed_logs do |t|
      t.text :title
      t.text :url
      t.text :summary
      t.references :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
