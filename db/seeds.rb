# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fridge.delete_all
Item.delete_all
FridgeItem.delete_all
User.delete_all

User.create!(email: "test@example.com", password: "test123", password_confirmation: "test123")

f = Fridge.create(name: "Hladilnik 1",
	location: "Dnevna soba", capacity: 100)

f.fridge_items.build(quantity: 1).tap { |fi|
	fi.build_item(title: "Mleko",
	price: 1.0) }.save

f.fridge_items.build(quantity: 2,
  item_id: Item.create(title: "Klobasa",
  price: 1.0).id).save
