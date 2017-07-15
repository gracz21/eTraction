class Ride < ApplicationRecord
  belongs_to :track
  has_many :messages
  has_many :statements
  has_many :user_videos

  validates :track, presence: true
end
