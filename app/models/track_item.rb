class TrackItem < ApplicationRecord
  default_scope { order(:track_id, :position) }

  belongs_to :stop
  belongs_to :track, inverse_of: :track_items
  acts_as_list scope: :track

  validates :travel_time, :down_time, :stop, presence: true
  validates :track_id, :uniqueness => { :scope => :stop_id }

  rails_admin do
    visible false
    edit do
      exclude_fields :position
    end
  end

  def name
    stop.name
  end
end
