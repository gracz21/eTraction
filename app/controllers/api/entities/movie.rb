module API::Entities
  class Movie < Grape::Entity
    root :movies, :movie

    expose :id, documentation: { type: 'Integer' }
    expose :title, documentation: { type: 'String', desc: 'Movie title.' }
    expose :genre, documentation: { type: 'String', desc: 'Movie genre.' }
    expose :length, documentation: { type: 'Integer', desc: 'Movie length (in minutes).' }
    expose :poster, documentation: { type: 'String', desc: 'Movie poster.' }
    expose :filename, documentation: { type: 'String', desc: 'Movie filename.' }
  end
end