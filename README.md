# README
Ruby on Rails API for movies and people database.
[API Heroku](http://movies-and-people.herokuapp.com/)
[Interface GitHub](https://github.com/Malvov/browse-interface)
[Interface live](https://browse-interface.herokuapp.com)
## 1. Endpoints
### 1.1 People
#### 1.1.1 GET /api/people
	People list, params: ?term for searching
#### 1.1.2 GET /api/people/:id
	Shows person with :id
#### 1.1.3 PUT /api/people/:id
	Updates person with :id
#### 	1.1.4 DELETE /api/people/:id
	Destroys person with :id
#### 1.1.5 POST /api/people
	Creates person, params: first_year, last_year, aliases, person_movies_attributes (movie_id, person_role)
### 1.2 Movies
#### 1.2.1 GET /api/movies
	Movies list, params: ?term for searching
#### 1.2.2 GET /api/movies/:id
	Shows movie with :id
#### 1.2.3 PUT /api/movies/:id
	Updates movie with :id
#### 	1.2.4 DELETE /api/movies/:id
	Destroys movie with :id
#### 1.2.5 POST /api/movies
	Creates movie, params: title, release_year, person_movies_attributes (person_id, person_role)
	
### 1.3 Other
#### 1.3.1 POST /api/user_token
	Returns a JWT token for authentication, params: auth[email], auth[password]
#### 1.3.2 POST /api/signup
	Creates user, params: email, password, passord_confirmation
## 2. Libraries/frameworks
	

 1. Ruby on Rails :heart_eyes:
 2. [Knock](https://github.com/nsarno/knock)
 3. [JWT](https://github.com/jwt/ruby-jwt)
