class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 資料驗證validations
  validates :username, presence: true, uniqueness: true

  # extend FriendlyId
  # friendly_id :username, use: :slugged

  # 每個人可以都有一個avatar
  has_one_attached :avatar
  #一個使用者可以有多個post
  has_many :posts
  has_many :likes
  has_many :commentlikes
  has_many :subscribes
  has_many :messages

  # 貼文喜歡
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

  # 留言喜歡
  def comlike?(comment)
    commentlikes.exists?(comliked: comment)
  end

  def comlike!(comment)
    if comlike?(comment)
      commentlikes.find_by(comliked: comment).destroy
      return "comlike"
    else
      commentlikes.create(comliked: comment)
      return "recomlike"
    end
  end
  
  # 作者訂閱
  def subscribe?(user)
    subscribes.exists?(subscribe: user)
  end

  def subscribe!(user)
    if subscribe?(user)
      subscribes.find_by(subscribe: user).destroy
      return "subscribe"
    else
      subscribes.create(subscribe: user)
      return "subscribed"
    end
  end

end
