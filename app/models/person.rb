class Person < ApplicationRecord
    has_many :person_movies, dependent: :destroy
    has_many :movies_as_actor_or_actress, -> { PersonMovie.actor_or_actress } , through: :person_movies, source: :movie
    has_many :movies_as_director, -> { PersonMovie.director } , through: :person_movies, source: :movie
    has_many :movies_as_producer, -> { PersonMovie.producer } , through: :person_movies, source: :movie
    accepts_nested_attributes_for :person_movies, reject_if: :all_blank

    validates_presence_of :first_name, :last_name
    validate :unique_person_full_name

    include PgSearch
    pg_search_scope :search, against: [:first_name, :last_name, :aliases], 
    using: {
        tsearch: {
          prefix: true
        }
    }

    private

    def unique_person_full_name
        if Person.where("LOWER(first_name) = ? AND LOWER(last_name) = ?",
            first_name.downcase, last_name.downcase).exists?
            errors.add(:base, 'Person with such info already exists')
        end
    end
end
