# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    Person.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, aliases: Faker::Lorem.word)
end

10.times do
    Movie.create!(title: Faker::Lorem.sentence, release_year: (2005..2018).to_a.sample)
end

Person.all.each do |person|
    person.movies_as_director << Movie.all.to_a.sample
    person.movies_as_actor_or_actress << Movie.all.to_a.sample
    person.movies_as_producer << Movie.all.to_a.sample
end

5.times do |n|
    User.create!(email: "mail#{n}@mail.com", password: 'password', password_confirmation: 'password')
end