class AddIntervalAndPeriodToBriefing < ActiveRecord::Migration[6.1]
  def change
    add_column :briefings, :period, :integer
    add_column :briefings, :interval, :integer
  end
end
