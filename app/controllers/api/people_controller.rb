class API::PeopleController < ApplicationController
  before_action :authenticate_user, except: [:index, :show] #authentication for unsafe methods
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    unless params[:term].blank?
      @people = Person.search(params[:term])
    else
      @people = Person.all
    end

    render json: @people
  end

  # GET /people/1
  def show
    render json: @person.info
  end

  # POST /people
  def create
    
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, location: api_people_path(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :aliases,
        person_movies_attributes: [:id, :movie_id, :person_role]
        )
    end
end
