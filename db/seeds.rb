# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "Seeding 2000 organizations..."

2000.times do
  Organization.create!(
    name: Faker::Company.name,
    phone_number: Faker::Number.number(digits: 10),
    address: Faker::Address.full_address,
    homepage: Faker::Internet.url
  )
end

puts "Seeding completed."
