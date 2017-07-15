class UserVideo < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :title, presence: true, length: { maximum: 50 }
  validates :user, :video, presence: true

  before_create :assign_ride

  mount_uploader :video, UserVideoUploader

  private

  def assign_ride
    self.ride = Ride.last
  end
end
