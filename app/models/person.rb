class Person < ApplicationRecord
    has_many :person_movies
    #has_many :movies, through: :person_movies
    has_many :movies_as_actor_or_actress, -> { PersonMovie.actor_or_actress } , through: :person_movies, source: :movie
    has_many :movies_as_director, -> { PersonMovie.director } , through: :person_movies, source: :movie
    has_many :movies_as_producer, -> { PersonMovie.producer } , through: :person_movies, source: :movie
end
