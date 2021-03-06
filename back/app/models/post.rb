class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :architecture, optional: true
  has_many :post_likes, dependent: :destroy
  has_many :like_users, through: :post_likes, source: :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 200 }
  validates :image, presence: true
end
