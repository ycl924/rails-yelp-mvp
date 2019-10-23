# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category:  ["chinese", "italian", "japanese", "french", "belgian"].sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code)
  restaurant.save!
end
puts 'Creating reviews'

5.times do
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: [0,1,2,3,4,5].sample)
    review.restaurant = restaurant
    review.save!
  end
end

puts 'Finished!'
