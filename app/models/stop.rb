class Stop < ApplicationRecord
  has_many :track_items
  has_many :tracks, through: :track_items

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
