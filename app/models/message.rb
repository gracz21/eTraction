class Message < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :text, presence: true, length: { maximum: 140 }
  validates :user, presence: true

  before_create :assign_ride

  private

  def assign_ride
    self.ride = Ride.last
  end
end
