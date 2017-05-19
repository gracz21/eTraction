class Stop < ApplicationRecord
  has_many :track_items
  has_many :tracks, through: :track_items

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  rails_admin do
    list do
      exclude_fields :track_items, :tracks
    end
    edit do
      exclude_fields :track_items, :tracks
    end
  end
end
