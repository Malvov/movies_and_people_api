class PersonMovie < ApplicationRecord
  belongs_to :person
  belongs_to :movie
end
