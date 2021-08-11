class Group < ApplicationRecord

  # 資料驗證validations
  validates :name, presence: true
  has_many :posts
end
