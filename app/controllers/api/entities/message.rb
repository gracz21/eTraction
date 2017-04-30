module API::Entities
  class Message < Grape::Entity
    root :messages, :message

    expose :id, documentation: { type: Integer, presence: true }
    expose :text, documentation: { type: String, desc: 'Message text', presence: true }
    expose :author, documentation: { type: String, desc: 'Username of message author', presence: true }
    expose :created_at, documentation: { type: DateTime, desc: 'Message creation time', presence: true }

    private
    def author
      object.user.username
    end
  end
end