class Track < ApplicationRecord
  has_many :track_items, inverse_of: :track
  has_many :stops, through: :track_items

  validates :name, :track_items, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  accepts_nested_attributes_for :track_items

  rails_admin do
    list do
      exclude_fields :stops
    end
    edit do
      exclude_fields :stops
    end
  end
end
