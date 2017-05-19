class TrackItem < ApplicationRecord
  default_scope { order(:track_id, :sequence_number) }

  belongs_to :stop
  belongs_to :track, inverse_of: :track_items

  validates :sequence_number, :travel_time, :stop, presence: true
  validates :sequence_number, uniqueness: { scope: :track_id }

  rails_admin do
    visible false
  end

  def name
    stop.name
  end
end
