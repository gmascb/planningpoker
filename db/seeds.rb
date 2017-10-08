# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.create(user: nil, name: 'SALA 1', players: 1)
Room.create(user: 'Guilherme', name: 'SALA 2', players: 0, refreshauto: true)
Poker.create(user: 'A', value: 5, room: Room.first.id)
Poker.create(user: 'B', value: 1, room: Room.first.id)
Poker.create(user: 'C', value: 2, room: Room.first.id)
Poker.create(user: 'D', value: 3, room: Room.first.id)
Poker.create(user: 'E', value: 5, room: Room.first.id)
Poker.create(user: 'F', value: 5, room: Room.first.id)
Poker.create(user: 'G', value: 1, room: Room.first.id)
Poker.create(user: 'H', value: 2, room: Room.first.id)
Poker.create(user: 'I', value: 5, room: Room.first.id)