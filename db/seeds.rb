# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
10.times do |restaurant|
  restaurant = Restaurant.create(name: Faker::Restaurant.name , address: Faker::Address.full_address, category: CATEGORIES.sample, phone_number: Faker::PhoneNumber.phone_number)
  puts "Created #{restaurant.name}"
end
puts "Finished creating restuarants!"

puts "Creating reviews..."

40.times do |review|
  review = Review.create(rating: rand(1..5), content: Faker::Restaurant.review, restaurant: Restaurant.all.sample)
  puts "Created #{review.rating}"
end
puts "All Done!"
