class Commentlike < ApplicationRecord
  belongs_to :user
  belongs_to :comliked, foreign_key: 'comliked_id', class_name: 'Comment'
end
