# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = %w[Rome London Paris Madrid Berlin]
hotels = ['Hotel de Rome', 'Adlon', 'Ritz Carlton', 'Waldrof Astoria', 'Grand Hyatt', 'Hilton', 'Regent', 'Das Stu', 'Holiday Inn', 'Westin Grand']
brands = ['Rocco Forte', 'Kempinsky', 'Ritz', 'Waldorf', 'Hyatt', 'Hilton', 'Regent', 'S/O', 'Holiday Inn', 'Marriot']
addresses = ['Behrenstraße 37, 10117 Berlin, Germany', 'Unter den Linden 77, 10117 Berlin, Germany', 'Potsdamer Platz 3, 10785 Berlin, Germany', 'Hardenbergstraße 28, 10623 Berlin, Germany', 'Marlene-Dietrich-Platz 2, 10785 Berlin, Germany', 'Mohrenstraße 30, 10117 Berlin, Germany', 'Charlotte And Fritz, Charlottenstraße 49, 10117 Berlin, Germany', 'Drakestraße 1, 10787 Berlin, Germany', 'Theanolte-Bähnisch-Straße 2, 10178 Berlin, Germany', 'Friedrichstraße 158, 10117 Berlin, Germany']
amenities = ['Great View', 'Jacuzzi', 'Full Bar', 'Servant', 'Kitchen', 'Balcony', 'Bath', 'Foot Message']
benefits = ['Early Check-in', 'Free Breakfast', '$500 Hotel Credit', 'Free Third Night']
adjectives = %w[Presidential Royal Deluxe Business King's Executive Pauper Dictator's Emperor's]
nouns = %w[Room Suite Villa Cubby Shack]
range = (1...10).to_a

puts 'cleaning database'
HotelBenefit.delete_all
RoomAmenity.delete_all
Room.delete_all
Hotel.delete_all
City.delete_all
Benefit.delete_all
Amenity.delete_all
Booking.delete_all
User.delete_all

puts 'seeding...'

user = User.create(email: 'en.pina1@gmail.com', password: 'secret', first_name: 'Nic', last_name: 'Pina', admin: true)
p user
amenities.each do |amenity|
  Amenity.create(name: amenity)
  puts "created #{amenity}"
end

# benefits.each do |benefit|
#   Benefit.create(name: benefit)
#   puts "created #{benefit}"
# end

cities.each do |city|
  City.create(name: city)
  puts "created #{city}"
end

hotels.each_with_index do |hotel, index|
  new_hotel = Hotel.create(name: hotel, city: City.last, brand: brands[index], address: addresses[index], review: Faker::Restaurant.review)
  5.times do
    beds = range.first(2).sample
    price = range.sample * 100
    size = range.sample * 10

    room = Room.create(name: adjectives.sample + ' ' + nouns.sample, size: size, beds: beds, price: price, hotel: new_hotel, special: (benefits.sample if range.sample > 7))

    p room

    if range.sample > 7
      bene = Benefit.all.sample
      HotelBenefit.create(room: room, benefit: bene)
      p bene
    end

    2.times do
      amen = Amenity.all.sample
      RoomAmenity.create(room: room, amenity: amen)
      p amen
    end
  end
end
