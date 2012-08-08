# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

f = Fridge.create!(name: "Hladilnik 1", location: "Dnevna soba", capacity: 100)

f.items.create!(title: "Mleko", price: 1)
f.items.create!(title: "Kruh", price: 0.5)