class Ride < ApplicationRecord
  belongs_to :track
  has_many :messages
  has_many :statements
  has_many :user_videos

  validates :track, presence: true

  rails_admin do
    list do
      exclude_fields :messages, :statements, :user_videos
    end
    edit do
      exclude_fields :messages, :statements, :user_videos
    end
  end

  def name
    "#{track.name}, #{created_at.in_time_zone('Europe/Berlin').strftime('%m-%d-%Y %H:%M')}"
  end
end
