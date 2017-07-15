class Statement < ApplicationRecord
  belongs_to :ride

  validates :title, :text, presence: true

  before_create :assign_ride
  after_create :send_notifications

  private

  def assign_ride
    self.ride = Ride.last
  end

  def send_notifications
    ActionCable.server.broadcast 'statement_notification_channel',
                                 API::Entities::Statement.represent(itself)
  end
end
