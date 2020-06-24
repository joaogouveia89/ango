# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bills = Bill.create(
	[
		{
			name: "Agua",
			image_icon: "drop"
		},
		{ 
			name: "Energia",
			image_icon: "light"
		},
		{
			name: "Internet",
			image_icon: "wifi"
		},
		{
			name: "Cartao de Credito",
			image_icon: "card"
		}
	]
)