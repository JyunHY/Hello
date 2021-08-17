class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image
  has_many :comments
  has_many :likes
  
  # 啟動paranoid
  acts_as_paranoid
  # 狀態控制AASM
  include AASM
  # 修改網址
  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged
  

  # 資料驗證validations
  validates :title, presence: true

  

  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end


  # def like?(user)
  #   likes.exists?(post_id: user)
  # end

  # def like!(user)
  #   if like?(user)
  #     likes.find_by(post_id: user).destroy
  #     return 'Follow'
  #   else
  #     likes.create(post_id: user)
  #     return 'Followed'
  #   end
  # end

  private
  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0, 8]]
    ]
  end
end
