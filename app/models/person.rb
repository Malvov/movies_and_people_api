class Person < ApplicationRecord
    has_many :person_movies
    has_many :movies, through: :person_movies
end
