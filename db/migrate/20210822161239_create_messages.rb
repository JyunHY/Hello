class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :foruser

      t.timestamps
    end
  end
end
