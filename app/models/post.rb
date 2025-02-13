class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1500 }
  validates :published_at, presence: true

  # Scope for active posts and past dates
  scope :active, -> { where(active: true) }
  scope :published_today_or_past, -> { where('published_at <= ?', Time.zone.now) }
  scope :featured, -> { where(featured: true).limit(5) }
end
