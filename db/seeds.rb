# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    Person.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, aliases: Faker::Lorem.word)
end

3.times do
    Movie.create!(title: Faker::Lorem.sentence, release_year: (2005..2018).to_a.sample)
end

# Person.all.each do |person|
#     person.movies << Movie.all.to_a.sample
# end

# PersonMovie.all.each do |pm|
#     pm.update(person_role: (0..2).to_a.sample)
# end