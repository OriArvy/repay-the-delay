# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(
  title: "Mr", first_name: "Bobby", last_name: "Mob", email: "blobberrr@repay.com", password: "111111", phone_number: "asdqwe12", address: "Westminster, London SW1A 1AA", postcode: "ig3b14", city: "London", country: "United Kingdom", sort_code: "333333", account_number: "333333333")

ticket_9 = Ticket.new!(
  ticket_number: '333333333',
  price: 64.23,
  valid_from: 20191111,
  expiry_date: 20191112,
  ticket_type: "season",
  user: user_1)
  url9 = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/British_rail_ticket_Wellington_Shrewsbury.jpg/250px-British_rail_ticket_Wellington_Shrewsbury.jpg"
  ticket_9.remote_photo_url = url9
  ticket_9.save!

