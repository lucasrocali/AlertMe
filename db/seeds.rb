# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_girl_rails'
20.times { FactoryGirl.create(:user) }
100.times { FactoryGirl.create(:location) }
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Category.create!(name:"Incendio")
Category.create!(name:"Alagamento")
Category.create!(name:"Chuva forte")