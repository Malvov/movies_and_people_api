module API
  class MoviesController < ApplicationController
    before_action :authenticate_user, except: [:index, :show] #authentication for unsafe methods
    before_action :set_movie, only: [:show, :update, :destroy]

    # GET /movies
    def index
      unless params[:term].blank?
        @movies = Movie.search(params[:term])
      else
        @movies = Movie.all
      end
      render json: @movies
    end

    # GET /movies/1
    def show
      render json: @movie
    end

    # POST /movies
    def create
      @movie = Movie.new(movie_params)

      if @movie.save
        render json: @movie, status: :created, location: api_movies_path(@movie)
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /movies/1
    def update
      if @movie.update(movie_params)
        render json: @movie
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end

    # DELETE /movies/1
    def destroy
      @movie.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_movie
        @movie = Movie.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def movie_params
        params.require(:movie).permit(:title, :release_year,
          person_movies_attributes: [:id, :person_id, :person_role]
        )
      end
  end
end