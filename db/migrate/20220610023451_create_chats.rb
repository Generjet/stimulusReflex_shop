class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :message
      t.string :sender
      t.string :receiver

      t.timestamps
    end
  end
end
