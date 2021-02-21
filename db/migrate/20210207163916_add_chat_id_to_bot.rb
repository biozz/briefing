class AddChatIdToBot < ActiveRecord::Migration[6.1]
  def change
    add_column :bots, :chat_id, :integer
  end
end
