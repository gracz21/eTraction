module API::Entities
  class Statement < Grape::Entity
    root :statements, :statement

    expose :id
    expose :title, documentation: { type: 'String', desc: 'Statement title.' }
    expose :text, documentation: { type: 'String', desc: 'Statement text.' }
    expose :created_at
  end
end