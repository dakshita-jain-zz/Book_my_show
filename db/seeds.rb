# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Movie.create(name: 'WAR',actor: 'Hrithik Roshan',director: 'XXXXXXXX',release_date: Date.parse("July 5 2019"),rating: 4)
Movie.create(name: 'Sholay',actor: 'Amithabh',director: 'YYYYYYYYYYY',release_date: Date.parse("March 11 2015"),rating: 3)
show1=Movie.first
show1.shows.create(venue:'S2',ticket_available: 100,price: 120,showtime: Time.new(2019, 10, 27, 3, 15))
show1.shows.create(venue:'PVR',ticket_available: 60,price: 150,showtime: Time.new(2019, 10, 28, 6, 45))
