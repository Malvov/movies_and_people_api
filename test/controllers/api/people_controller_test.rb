require 'test_helper'

class API::PeopleControllerTest < ActionDispatch::IntegrationTest

    def setup
        @person = Person.create!(first_name: 'Mister', last_name: 'X.')
    end

    test 'should get movies' do
        get api_people_path
        assert_response :success
    end

    test "can't create, update or delete people if unauthorized" do
        assert_no_difference 'Person.count' do
            post api_movies_path, params: {
                                        person: {
                                            first_name: 'Joanna',
                                            last_name: 'Doe'
                                        }
                                    }
        end
        assert_response 401

        put api_person_path(@person), params: {
                                            person: {
                                                first_name: 'John',
                                                last_name: 'Doe'
                                            }
                                        }
        assert_response 401

        delete api_person_path(@person)
        assert_response 401
    end

end