class Ride < ApplicationRecord
  belongs_to :track

  validates :track, presence: true
end
