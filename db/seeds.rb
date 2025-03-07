# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
puts "seeding"

puts "------------------------"
puts ""

puts "empty user table"
User.destroy_all
Bird.destroy_all
Booking.destroy_all

puts "create new users..."
for a in 1..10 do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email, password: password)
end
puts "#{User.count} user created"

puts "------------------------"
puts ""

puts "create new birds..."
for a in 1..20 do
  prefix = Faker::Creature::Bird.adjective
  location = Faker::Creature::Bird.geo
  bird = Faker::Creature::Bird.common_family_name
  cat = ["Exotic birds", "Large birds", "Birds for Therapy", "Birds for Breeding", "Messenger Birds"].sample
  title = "#{prefix} #{location} #{bird}"
  description = Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 4)
  price = rand(10..100)
  user_id = User.all.sample.id

  Bird.create!(categories: cat, title: title, description: description, price: price, user_id: user_id)
end
puts "#{Bird.count} birds created"

puts "------------------------"
puts ""

puts "generate some bookings"

for a in 1..5 do
  bird_id = Bird.all.sample.id
  user_id = User.all.sample.id
  status = "pending"
  d = DateTime.now
  d.strftime("%d/%m/%Y")

  Booking.create!(bird_id: bird_id, user_id: user_id, status: status, start_date: d, end_date: d)
end

puts "#{Booking.count} bookings created"
