class RestaurantMenuItem < ApplicationRecord
  validates :name, :price, :image, :weight, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :image, url: true
end
