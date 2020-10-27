# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  product = Product.create!(name: Faker::Name.name, country_of_origin: Faker::Address.country, cost: Faker::Number.between(from: 100, to: 500))
  5.times do
    product.reviews.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false), rating: Faker::Number.between(from: 1, to: 5))
  end
end
