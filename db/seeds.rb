# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_2 = User.create!(
  title: "Mr", first_name: "Ben", last_name: "Whitehouse", email: "ben@repay.com", password: "111111", phone_number: "ben101", address: "Westminster, London SW1A 1AA", postcode: "SW1A 1AA", city: "London", country: "United Kingdom", sort_code: "444444", account_number: "44444444")
user_3 = User.create!(
  title: "Mr", first_name: "Thomas", last_name: "Britz", email: "thomas@repay.com", password: "111111", phone_number: "thomas101", address: "Westminster, London SW1A 1AA", postcode: "SW1A 1AA", city: "London", country: "United Kingdom", sort_code: "555555", account_number: "55555555")
user_4 = User.create!(
  title: "Mr", first_name: "Rokas", last_name: "Vaitkevicius", email: "rokas@repay.com", password: "111111", phone_number: "rokas101", address: "Westminster, London SW1A 1AA", postcode: "SW1A 1AA", city: "London", country: "United Kingdom", sort_code: "666666", account_number: "66666666")
user_5 = User.create!(
  title: "Mr", first_name: "Matt", last_name: "Annetts", email: "matt@repay.com", password: "111111", phone_number: "matt101", address: "Westminster, London SW1A 1AA", postcode: "SW1A 1AA", city: "London", country: "United Kingdom", sort_code: "777777", account_number: "77777777")


ticket_2 = Ticket.new(
  ticket_number: '444444444',
  price: 264.23,
  valid_from: 20190302,
  expiry_date: 20200302,
  ticket_type: "season",
  user: user_2)
  url2 = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/British_rail_ticket_Wellington_Shrewsbury.jpg/250px-British_rail_ticket_Wellington_Shrewsbury.jpg"
  ticket_2.remote_photo_url = url2
  ticket_2.save!

ticket_3 = Ticket.new(
  ticket_number: '555555555',
  price: 413,
  valid_from: 20190811,
  expiry_date: 20190912,
  ticket_type: "monthly",
  user: user_3)
  url3 = "https://i2-prod.mirror.co.uk/incoming/article11095561.ece/ALTERNATES/s615b/SUNDAY-MIRROR-PRODUCTION-TICKETS.jpg"
  ticket_3.remote_photo_url = url3
  ticket_3.save!

ticket_4 = Ticket.new(
  ticket_number: '666666666',
  price: 53.12,
  valid_from: 20190812,
  expiry_date: 20190819,
  ticket_type: "weekly",
  user: user_4)
  url4 = "https://www.google.com/search?biw=1920&bih=934&tbm=isch&sa=1&ei=bqdmXfCVF434abCJsNgO&q=national+rails+season+ticket&oq=national+rails+season+ticket&gs_l=img.3...388808.388808..389030...0.0..0.47.47.1......0....1..gws-wiz-img.dzS0NqN43-o&ved=0ahUKEwjwhLCC-qXkAhUNfBoKHbAEDOsQ4dUDCAY&uact=5#imgdii=ZhRhQOrFYL6MLM:&imgrc=-LHXB6690CFQKM:"
  ticket_4.remote_photo_url = url4
  ticket_4.save!

ticket_5 = Ticket.new(
  ticket_number: '777777777',
  price: 420,
  valid_from: 20190812,
  expiry_date: 20200819,
  ticket_type: "season",
  user: user_5)
  url5 = "http://www.bluemaize.net/im/arts-crafts-sewing/train-tickets-8.jpg"
  ticket_5.remote_photo_url = url5
  ticket_5.save!
