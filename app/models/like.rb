class Like < ApplicationRecord
  belongs_to :user
  belongs_to :liked, foreign_key: 'liked_id', class_name: 'Post'
end
