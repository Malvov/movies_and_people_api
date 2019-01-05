class MovieSerializer < ApplicationSerializer
  attributes :id, :title, :release_year, :producers, :directors, :casting

  def release_year
    object.romanized_release_year
  end

  def directors
    person_info(object.directors)
  end

  def casting
    person_info(object.casting)
  end

  def producers
    person_info(object.producers)
  end

  private

  def person_info(people)
    people.collect do |person|
      {
        id: person.id,
        first_name: person.first_name,
        last_name: person.last_name
      }
    end
  end
end
