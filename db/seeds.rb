# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = '123'
# user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 

    user['name'] = Faker::Name.name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Listings
food = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  20.times do 
    food['name'] = Faker::Food.dish
    food['cuisine'] = Faker::Food.ingredient
    food['location'] = Faker::Address.state
    food['price'] = rand(80..500)
    food['user_id'] = uids.sample

    Food.create(food)
  end
end