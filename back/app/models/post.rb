class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :post_likes, dependent: :destroy
  has_many :like_users, through: :post_likes, source: :user

  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true
end