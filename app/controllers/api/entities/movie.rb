module API::Entities
  class Movie < Grape::Entity
    root :movies, :movie

    expose :id, documentation: { type: Integer, presence: true }
    expose :title, documentation: { type: String, desc: 'Movie title', presence: true  }
    expose :genre, documentation: { type: String, desc: 'Movie genre', presence: true  }
    expose :length, documentation: { type: Integer, desc: 'Movie length (in minutes)', presence: true  }
    expose :poster, documentation: { type: String, desc: 'Movie poster', presence: true  }
    expose :filename, documentation: { type: String, desc: 'Movie filename', presence: true  }
  end
end