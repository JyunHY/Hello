class AddLikeToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :like, :string
  end
end
