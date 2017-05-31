class Statement < ApplicationRecord
  validates :title, :text, presence: true

  after_create :send_notifications

  private

  def send_notifications
    ActionCable.server.broadcast 'statement_notification_channel',
                                 API::Entities::Statement.represent(itself)
  end
end
