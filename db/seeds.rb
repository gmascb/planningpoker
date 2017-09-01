# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Poker.create(user: 'A', value: 5, room: 2)
Poker.create(user: 'B', value: 1, room: 2)
Poker.create(user: 'C', value: 2, room: 2)
Poker.create(user: 'D', value: 3, room: 2)
Poker.create(user: 'E', value: 5, room: 2)
Poker.create(user: 'F', value: 5, room: 2)
Poker.create(user: 'G', value: 1, room: 2)
Poker.create(user: 'H', value: 2, room: 2)
Poker.create(user: 'I', value: 5, room: 2)
Room.create(user: nil, name: 'SALAUSUARIO', players: 1)