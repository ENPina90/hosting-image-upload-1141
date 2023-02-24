# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'faker'

puts "destroying articles"
Article.all.each do |article|
  article.photo.purge
end
Article.destroy_all

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
article = Article.new(title: "NES", body: "A great console")
article.photo.attach(io: file, filename: article.title, content_type: "image/png")
article.save

10.times do
  file = URI.open('https://source.unsplash.com/featured?kitty')

  article = Article.create(title: Faker::Hacker.say_something_smart, body: Faker::Hacker.say_something_smart)
  article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  article.save
  p article
end
