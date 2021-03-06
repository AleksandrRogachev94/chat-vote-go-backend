class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.index :user_id
      t.integer :chatroom_id
      t.index :chatroom_id

      t.timestamps
    end
  end
end
