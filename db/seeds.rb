# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all the things"
Food.destroy_all
Entry.destroy_all
CalorieGoal.destroy_all
User.destroy_all

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

User.all.each do |user|
  rand(5..10).times do 
    Food.create!(
      name: Faker::Food.dish,
      calories: Faker::Number.within(range: 1..950),
      portion_size: Faker::Food.measurement,
      notes: Faker::Food.description,
      user: user
    )
  end
  Entry.create!(
    entry_date: Date.today,
    user: user
  ).tap do |entry|
    entry.foods = Food.all.sample(3)
  end

  Entry.create!(
    entry_date: Date.today - 1,
    user: user
  ).tap do |entry|
    entry.foods = Food.all.sample(5)
  end

  Entry.create!(
    entry_date: Date.today - 2,
    user: user
  ).tap do |entry|
    entry.foods = Food.all.sample(4)
  end

end

puts "#{Food.count} food(s) & #{Entry.count} entries created!"