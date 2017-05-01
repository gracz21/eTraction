module API::Entities
  class User < Grape::Entity
    root :users, :user

    expose :id, documentation: { type: Integer, presence: true }
    expose :username, documentation: { type: String, desc: 'User username', presence: true }
  end
end