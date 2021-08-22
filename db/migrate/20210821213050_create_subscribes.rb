class CreateSubscribes < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :subscribe_id

      t.timestamps
    end
    add_index :subscribes, :subscribe_id
  end
end
