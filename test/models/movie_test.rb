require 'test_helper'
class MovieTest < ActiveSupport::TestCase

    def setup
        @movie = Movie.new(title: 'Ruby on Rails: Reloaded', release_year: 2018)
    end

    test 'movie info should be present' do
        @movie.title = ''
        @movie.release_year = ''
        assert_not @movie.valid?
    end
end