class TrackItem < ApplicationRecord
  default_scope { order(:track_id, :sequence_number) }

  belongs_to :stop
  belongs_to :track

  validates :sequence_number, :travel_time, :stop, :track, presence: true
  validates :sequence_number, uniqueness: { scope: :track_id }
end
