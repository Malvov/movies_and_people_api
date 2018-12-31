require 'test_helper'

class API::MoviesControllerTest < ActionDispatch::IntegrationTest

    def setup
        @movie = Movie.create!(title: 'Movie', release_year: 2018)
    end

    test 'should get movies' do
        get api_movies_path
        assert_response :success
    end

    test "can't create, update or delete movies if unauthorized" do
        assert_no_difference 'Movie.count' do
            post api_movies_path, params: {
                                        movie: {
                                            title: 'Movie',
                                            release_year: 2018
                                        }
                                    }
        end
        assert_response 401

        put api_movie_path(@movie), params: {
                                            movie: {
                                                title: 'Movie edited',
                                                release_year: 2009
                                            }
                                        }
        assert_response 401

        delete api_movie_path(@movie)
        assert_response 401
    end

end