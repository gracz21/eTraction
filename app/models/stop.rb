class Stop < ApplicationRecord
  has_many :track_items
  has_many :tracks, through: :track_items

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  rails_admin do
    list do
      exclude_fields :track_items, :tracks
    end
    edit do
      exclude_fields :track_items, :tracks, :latitude, :longitude
    end
  end
end
