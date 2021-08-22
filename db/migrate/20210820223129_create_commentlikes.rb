class CreateCommentlikes < ActiveRecord::Migration[6.0]
  def change
    create_table :commentlikes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :comliked_id

      t.timestamps
    end
    add_index :commentlikes, :comliked_id
  end
end
