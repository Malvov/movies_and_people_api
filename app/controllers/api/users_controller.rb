module API
    class UsersController < ApplicationController
        
        def create
            user = User.new(user_params)
            if user.save
                render json: { status: 200, msg: 'User was created.' }
            else
                render json: { status: 403, msg: 'bad request' }
            end
        end

        private
        # Setting up strict parameters for when we add account creation.
        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
    end
end