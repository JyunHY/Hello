class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.integer :liked_id

      t.timestamps
    end
      add_index :likes, :liked_id
  end
end
