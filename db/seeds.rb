# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

puts "Creating seeds:"

def create_person(options = {})
  Person.create!(
  	first_name: Faker::Name.first_name,
  	last_name: Faker::Name.last_name,
  	email: Faker::Internet.email,
  	job: Faker::Company.profession,
  	bio: Faker::Company.catch_phrase,
  	gender: options[:genre],
  	birthdate: Faker::Date.between(60.years.ago, 10.years.ago),
  	picture: Faker::Internet.url
  	)
end


SeedReport.for_model Person do
	10.times.each { create_person(genre: 'M')  }
	10.times.each { create_person(genre: 'F')  }
end

