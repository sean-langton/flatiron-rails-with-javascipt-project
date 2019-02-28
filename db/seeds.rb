# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list[
  ["Test User 1", "Test" "testuser1@email.com"]
  ["Test User 2", "Test" "testuser2@email.com"]
  ["Test User 3", "Test" "testuser3@email.com"]
  ["Test User 4", "Test" "testuser4@email.com"]
]

league_list [
  ["Test League 1", 4, 1]
  ["Test League 2", 10, 1]
]

fleet_list [
  ["Test Fleet 1", 1, 1]
  ["Test Fleet 2", 1, 2]
  ["Test Fleet 3", 1, 3]
  ["Test Fleet 4", 1, 4]
  ["Test Fleet 5", 2, 1]
]

ship_list [
  ['Boaty McBoatFace', 'Handymax', ]
]
user = User.create(username: 'test', password: 'test', email: 'test' )
league = League.create(name: 'Test League', num_of_fleets: 10, admin_id: user.id)
ship = Ship.create(name: 'Boaty McBoatFace', size: 'Handymax', max_cargo:1000, max_distance:500 )
fleet = Fleet.create(name: 'Fleet 1', league: league, user: user)
