class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :subscribe, foreign_key: 'subscribe_id', class_name: 'User'
end
