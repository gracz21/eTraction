class StatementNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'statement_notification_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
