class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 資料驗證validations
  validates :username, presence: true, uniqueness: true

  # 每個人可以都有一個avatar
  has_one_attached :avatar
end
