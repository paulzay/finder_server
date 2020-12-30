# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
car1 = Car.create(
	{
	make: "Audi",
	model: "R8 Spyder",
	year: 2019,
	description: "lorem ipsum blah blah blah",
	image_url: "https://storage.googleapis.com/gtspirit/uploads/2018/02/Audi-RS4-Avant-14.jpg",
	"user_id": 1
})
car2 = Car.create(
	{
	make: "Audi",
	model: "RS4 Avant",
	year: 2019,
	description: "lorem ipsum blah blah blah",
	image_url: "https://storage.googleapis.com/gtspirit/uploads/2018/02/Audi-RS4-Avant-14.jpg",
	"user_id": 1
})