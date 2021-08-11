class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.datetime :deleted_at
      t.integer :position

      t.timestamps
    end
  end
end
