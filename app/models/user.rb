class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 資料驗證validations
  validates :username, presence: true, uniqueness: true

  # 每個人可以都有一個avatar
  has_one_attached :avatar
  #一個使用者可以有多個post
  has_many :posts
  has_many :likes

  def like?(post)
    likes.exists?(liked: post)
  end

  def like!(post)
    if like?(post)
      likes.find_by(liked: post).destroy
      return "like"
    else
      likes.create(liked: post)
      return "relike"
    end
  end

end
