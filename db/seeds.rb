# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'test', password: 'test', email: 'test' )
league = League.create(name: 'Test League', num_of_fleets: 10, admin_id: user.id)
ship = Ship.create(name: 'Boaty McBoatFace', size: 'Handymax', max_cargo:1000, max_distance:500 )
fleet = Fleet.create(name: 'Fleet 1')
fleet.league = league
fleet.user = user
