# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do 
    User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone
    )
end 


Art.create ([ 
            { "title": "Portrait",
            "img": "http://static1.squarespace.com/static/53e031f1e4b088c3aac80e47/t/5636ebf1e4b0683b6c56cb43/1446440030277/hypatia.jpg",
            "description": "type here details on art" ,
            "size": "30 * 30 inch",
            "style": "realism",
            "medium": "graphics",
            "material": "paper",
            "user_id": 1
            },
            { "title": "Landscape",
            "img": "http://static1.squarespace.com/static/53e031f1e4b088c3aac80e47/t/5636ebf1e4b0683b6c56cb43/1446440030277/hypatia.jpg",
            "description": "type here details on art" ,
            "size": "50 * 70 inch",
            "style": "abstract impressionism",
            "medium": "oil",
            "material": "canvas",
            "user_id": 2
            }
])

puts "Seeded database"