class HomeController < ApplicationController
    def index
        render json: { message: 'See https://github.com/Malvov/movies_and_people_api#readme for usage' }
    end
end