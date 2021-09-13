class AddTalkroomToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :talkroom, :string
    add_index :messages, :talkroom
  end
end
