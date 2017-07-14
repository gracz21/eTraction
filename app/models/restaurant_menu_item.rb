class RestaurantMenuItem < ApplicationRecord
  validates :name, :price, :image, :weight, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  mount_uploader :image, RestaurantMenuItemImageUploader
end
