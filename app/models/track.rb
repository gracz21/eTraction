class Track < ApplicationRecord
  has_many :track_items
  has_many :stops, through: :track_items

  validates :name, :track_items, :stops, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
