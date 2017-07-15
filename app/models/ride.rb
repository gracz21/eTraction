class Ride < ApplicationRecord
  belongs_to :track
  has_many :user_videos

  validates :track, presence: true
end
