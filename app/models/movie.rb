class Movie < ApplicationRecord
    has_many :person_movies, dependent: :destroy
    has_many :casting, -> { PersonMovie.actor_or_actress } , through: :person_movies, source: :person
    has_many :directors, -> { PersonMovie.director } , through: :person_movies, source: :person
    has_many :producers, -> { PersonMovie.producer } , through: :person_movies, source: :person
    accepts_nested_attributes_for :person_movies, reject_if: :all_blank

    ROMAN_NUMBERS = {
        1000 => "M",  
        900 => "CM",
        500 => "D",  
        400 => "CD",
        100 => "C",  
        90 => "XC",  
        50 => "L",  
        40 => "XL",  
        10 => "X",  
        9 => "IX",  
        5 => "V",  
        4 => "IV",  
        1 => "I"
    }

    def romanized_release_year
        n = release_year
        roman = ""
        ROMAN_NUMBERS.each do |value, letter|
            roman << letter*(n / value)
            n = n % value
        end
        roman    
    end
end
