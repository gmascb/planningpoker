# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.create(user: nil, name: 'SALA 1', players: 0)

Room.create(user: 'Guilherme Barbosa', name: 'SALA 2', players: 0, refreshauto: true, bloqcartarepet: true)

Poker.create(user: 'Guilherme Barbosa', value: 5, room: Room.first.id)
Poker.create(user: 'Guilherme Mascarenhas', value: 1, room: Room.first.id)
Poker.create(user: 'Thiago Alves', value: 2, room: Room.first.id)
Poker.create(user: 'Helbert César', value: 3, room: Room.first.id)
Poker.create(user: 'Flavio Silva Lourenço', value: 5, room: Room.first.id)
Poker.create(user: 'Priscila Miranda', value: 5, room: Room.first.id)
Poker.create(user: 'Ricardo Alvarenga', value: 1, room: Room.first.id)
Poker.create(user: 'Thales Alves Boa Sorte', value: 2, room: Room.first.id)
Poker.create(user: 'Wladimir Junior', value: 5, room: Room.first.id)
Poker.create(user: 'Marcelo Rodrigo de Carvalho', value: 1, room: Room.first.id)

=begin
Poker.create(user: 'Halbert Leonardo Luciano', value: 2, room: Room.first.id)
Poker.create(user: 'Cristina Almeida', value: 5, room: Room.first.id)
Poker.create(user: 'Juliano Prates', value: 5, room: Room.first.id)
Guilherme, Thiago Alves, Helbert César, Flavio Silva Lourenço, Priscila Miranda, Ricardo Alvarenga,Thales Alves Boa Sorte, Wladimir Junior, Marcelo Rodrigo de Carvalho, Halbert Leonardo Luciano, Cristina Almeida, Juliano Prates
=end