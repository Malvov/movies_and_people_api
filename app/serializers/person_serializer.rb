class PersonSerializer < ApplicationSerializer
  attributes :id, :first_name, :last_name, :aliases, :movies_as_actor_or_actress, :movies_as_director, :movies_as_producer

  def movies_as_actor_or_actress
    movie_info(object.movies_as_actor_or_actress)
  end

  def movies_as_director
    movie_info(object.movies_as_director)
  end

  def movies_as_producer
    movie_info(object.movies_as_producer)
  end

  private

  def movie_info(movies)
    movies.collect do |movie|
      {
        title: movie.id,
        release_year: movie.romanized_release_year
      }
    end
  end
end
