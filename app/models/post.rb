class Post < ApplicationRecord
  belongs_to :user
  has_many :shoppings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :genre, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 1 }
  
  enum genre: [ "ジャンルなし", "キッチン用品", "文具", "衛生・清掃", "洗面・バス", "化粧品", "収納", "電気", "雑貨", "食品", "DIY"]

  mount_uploader :image, ImageUploader
end
