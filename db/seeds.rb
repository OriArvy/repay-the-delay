# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ticket_9 = Ticket.create!(
  ticket_number: '55221123',
  price: 64.23,
  valid_from: 20191111,
  expiry_date: 20191112,
  ticket_type: "season",
  user: user_1)
  url9 = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/British_rail_ticket_Wellington_Shrewsbury.jpg/250px-British_rail_ticket_Wellington_Shrewsbury.jpg"
  venue_9.remote_ticket_photo_url = url9
  venue_9.save!
