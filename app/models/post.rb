class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image

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

  private
  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0, 8]]
    ]
  end
end
