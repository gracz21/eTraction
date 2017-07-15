class Message < ApplicationRecord
  default_scope { order(:created_at) }
  
  belongs_to :user
  belongs_to :ride

  validates :text, presence: true, length: { maximum: 140 }
  validates :user, presence: true

  before_create :assign_ride

  rails_admin do
    edit do
      exclude_fields :ride
    end
  end

  private

  def assign_ride
    self.ride = Ride.last
  end
end
