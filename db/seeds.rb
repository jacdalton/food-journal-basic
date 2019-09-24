# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating test account"

User.create!(email: "test@test.com", password: "123123")

puts "Test account created (email: test@test.com, password: 123123)"

puts "Creating random users"

10.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: "123123"
  )
end

puts "#{User.count - 1} user(s) created!"

puts "Cooking up some food & creating entries..."

def adv_time
  n = rand(0..10)
  Date.current.advance(days: n)
end

User.all.each do |user|
  rand(3..5).times do 
    Food.create!(
      name: Faker::Food.dish,
      calories: Faker::Number.within(range: 1..950),
      portion_size: Faker::Food.measurement,
      notes: Faker::Food.description,
      user: user
    )
    Entry.create!(
      entry_date: adv_time,
      user: user
    ).tap do |entry|
      entry.foods = Food.all.sample(2)
    end
  end
end

puts "#{Food.count} food(s) & #{Entry.count} entries created!"