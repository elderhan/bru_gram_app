# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

first_user = User.create! email: "m@h.com", password: "password", password_confirmation: "password"

second_user = User.create! email: "s@b.com", password: "michigan", password_confirmation: "michigan"

Photo.delete_all

Photo.create! image: "https://i.imgur.com/evgXlNx.jpg?1", public: false, caption: "Ostrich on the Beach!", user_id: first_user.id

Photo.create! image: "https://i.imgur.com/k77Pj5d.jpg?1", public: false, caption: "Cape of Good Hope!", user_id: first_user.id

Photo.create! image: "https://i.imgur.com/V7eH8xk.jpg?1", public: false, caption: "Visiting the heart of Cape Town", user_id: second_user.id

test_photo = Photo.create! image: "http://i.imgur.com/HbpmF9K.jpg?1", public: true, caption: "Hought Bay", user_id: second_user.id

Photo.create! image: "http://i.imgur.com/ZHFrJsX.jpg?1", public: true, caption: "Cape Point", user_id: first_user.id

Comment.delete_all

Comment.create! body: "Hello!", user_id: second_user.id, photo_id: test_photo.id

puts "Created all"
