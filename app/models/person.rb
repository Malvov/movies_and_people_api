class Person < ApplicationRecord
    has_many :person_movies, dependent: :destroy
    has_many :movies_as_actor_or_actress, -> { PersonMovie.actor_or_actress } , through: :person_movies, source: :movie
    has_many :movies_as_director, -> { PersonMovie.director } , through: :person_movies, source: :movie
    has_many :movies_as_producer, -> { PersonMovie.producer } , through: :person_movies, source: :movie
    accepts_nested_attributes_for :person_movies, reject_if: :all_blank

    def info
        { 'person': self, 
            'movies as actor or actres': movies_as_actor_or_actress, 
            'movies as director': movies_as_director, 
            'movies as producer': movies_as_producer }
    end
end
