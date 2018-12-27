class PersonMovie < ApplicationRecord
  enum person_role: { actor_or_actress: 0, producer: 1, director: 2 }
  belongs_to :person
  belongs_to :movie
end
