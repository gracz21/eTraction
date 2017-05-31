class Stop < ApplicationRecord
  has_many :track_items
  has_many :tracks, through: :track_items

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  geocoded_by :name
  after_validation :geocode, if: ->(obj) { obj.name.present? and obj.name_changed? }

  rails_admin do
    list do
      exclude_fields :track_items, :tracks
    end
    edit do
      exclude_fields :track_items, :tracks, :latitude, :longitude
    end
  end
end
