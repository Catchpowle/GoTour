# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

2.times do
  fan = Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "London", country: "UK")
  fan.artists << Artist.third
  fan.artists << Artist.fourth
  fan.artists << Artist.fifth
end

24.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Edinburgh", country: "UK").artists << Artist.first }
16.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Cardiff", country: "UK").artists << Artist.first }
20.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Birmingham", country: "UK").artists << Artist.first }
12.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Glasgow", country: "UK").artists << Artist.first }
4.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Swansea", country: "UK").artists << Artist.first }
22.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Leeds", country: "UK").artists << Artist.first }
8.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Bristol", country: "UK").artists << Artist.first }
14.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Newcastle", country: "UK").artists << Artist.first }
10.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Nottingham", country: "UK").artists << Artist.first }
18.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Sheffield", country: "UK").artists << Artist.first }
6.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Liverpool", country: "UK").artists << Artist.first }
