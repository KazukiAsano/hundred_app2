# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# お試し
# Review.create!([{id:1,user_id:3,post_id:1,rate:2.0},{id:2,user_id:4,post_id:1,rate:4.5},{id:3,user_id:3,post_id:2,rate:2.0},{id:4,user_id:4,post_id:2,rate:2.5}])

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?