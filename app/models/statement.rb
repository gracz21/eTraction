class Statement < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :ride

  validates :title, :text, presence: true

  before_create :assign_ride
  after_save :send_notifications

  rails_admin do
    edit do
      exclude_fields :ride
    end
  end

  private

  def assign_ride
    self.ride = Ride.last
  end

  def send_notifications
    ActionCable.server.broadcast 'statement_notification_channel',
                                 API::Entities::Statement.represent(itself)
  end
end
