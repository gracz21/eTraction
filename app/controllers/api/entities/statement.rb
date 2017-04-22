module API::Entities
  class Statement < Grape::Entity
    root :statements, :statement

    expose :id, documentation: { type: Integer, presence: true  }
    expose :title, documentation: { type: String, desc: 'Statement title', presence: true  }
    expose :text, documentation: { type: String, desc: 'Statement text', presence: true  }
    expose :created_at, documentation: { type: DateTime, des: 'Statement creation time', presence: true }
  end
end