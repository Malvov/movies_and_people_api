class Movie < ApplicationRecord
    has_many :person_movies
    has_many :people, through: :person_movies
end
