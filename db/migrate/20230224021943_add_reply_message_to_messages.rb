class AddReplyMessageToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :reply_message, :jsonb
  end
end
