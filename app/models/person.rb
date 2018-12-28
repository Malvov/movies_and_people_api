class Person < ApplicationRecord
    has_many :person_movies, dependent: :destroy
    has_many :movies_as_actor_or_actress, -> { PersonMovie.actor_or_actress } , through: :person_movies, source: :movie
    has_many :movies_as_director, -> { PersonMovie.director } , through: :person_movies, source: :movie
    has_many :movies_as_producer, -> { PersonMovie.producer } , through: :person_movies, source: :movie
    accepts_nested_attributes_for :person_movies, reject_if: :all_blank

    include PgSearch
    pg_search_scope :search, against: [:first_name, :last_name, :aliases], 
    using: {
        tsearch: {
          prefix: true
        }
    }

    def info
        { 
            'person': self, 
            'movies_as_actor_or_actress': movies_as_actor_or_actress.map { |movie| movie.info }, 
            'movies_as_director': movies_as_director.map { |movie| movie.info }, 
            'movies_as_producer': movies_as_producer.map { |movie| movie.info }
        }
    end
end
