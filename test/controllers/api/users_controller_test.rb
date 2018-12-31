require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = User.create!(email: 'email@mail.com', password: 'password', password_confirmation: 'password')
    end

    test 'invalid signup' do
        assert_no_difference 'User.count' do
            post api_signup_path, params: {
                                        # existing user
                                        user: {
                                            email: 'email@mail.com',
                                            password: '123456',
                                            password_confirmation: '123456'
                                        }
                                    }
        end
    end

    test 'invalid signin' do
        post api_user_token_path, params: { 
                                    auth: {
                                        email: 'email@mail.com',
                                        password: '123456'
                                    } 
                                }
        assert_response :missing
    end

end