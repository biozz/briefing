class AddLastRunAndNextRunToBriefing < ActiveRecord::Migration[6.1]
  def change
    add_column :briefings, :last_run_at, :datetime
    add_column :briefings, :next_run_at, :datetime
  end
end
