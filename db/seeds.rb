# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = %w[Rome London Paris Madrid Berlin]
hotels = ['Hotel de Rome', 'Adlon', 'Ritz Carlton', 'Waldrof Astoria', 'Grand Hyatt', 'Hilton', 'Regent', 'Das Stu', 'Holiday Inn', 'Westin Grand']
photos = [['https://reisetopia.leonardocontentcloud.com/imageRepo/7/0/114/763/14/Hotel_de_Rome_-_Rooftop_Terrace_2_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/3/0/79/134/102/RFH_Hotel_de_Rome_-_Facade_8521_JG_Nov_16_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/3/0/79/134/200/RFH_Hotel_de_Rome_-_Lobby_8283_JG_Nov_16_P.jpg',], ['https://rt-hotels.s3.eu-central-1.amazonaws.com/4235_1.jpg', 'https://rt-hotels.s3.eu-central-1.amazonaws.com/4235_16.jpg', 'https://rt-hotels.s3.eu-central-1.amazonaws.com/4235_34.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/7/0/109/711/249/berzt-lobby-8280-hor-clsc_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/7/0/109/711/236/berzt-entrance-8292-hor-clsc_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/7/0/109/711/241/berzt-staircase-8286-hor-clsc_P.jpg'], ['https://rt-hotel-images-prod.s3.amazonaws.com/2384_IcePortal_1.jpg', 'https://rt-hotel-images-prod.s3.amazonaws.com/2384_IcePortal_6.jpg', 'https://rt-hotel-images-prod.s3.amazonaws.com/2384_IcePortal_9.jpg'], ['https://rt-hotel-images-prod.s3.amazonaws.com/2496_IcePortal_0.jpg', 'https://rt-hotel-images-prod.s3.amazonaws.com/2496_IcePortal_1.jpg', 'https://rt-hotel-images-prod.s3.amazonaws.com/2496_IcePortal_2.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/6/0/88/698/852/Hotel-Palace-Berlin-Panorama-c-Franz-Br_ck_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/3/0/39/410/793/Hotel_Palace_Lobby_Kischen_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/2/0/70/767/622/Hotel-Palace-Berlin-Business_Deluxe-Zimmer-Room_P.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/6/0/101/734/617/BERCT_5766828750_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/6/0/101/663/105/BERCT_5573005784_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/6/0/101/663/83/BERCT_5573056403_P.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/6/0/95/925/448/berak-lobby-0007-hor-clsc_P.jpg','https://reisetopia.leonardocontentcloud.com/imageRepo/6/0/95/925/438/berak-entrance-0060-hor-clsc_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/6/0/95/925/460/berak-courtyard-0035-hor-clsc_P.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/4/0/59/96/521/01_terrace_P.jpg', 'https://reisetopia.leonardocontentcloud.com/imageRepo/4/0/59/96/578/03_lobby_P.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/4/0/59/96/586/04_restaurant_P.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/7/0/103/577/421/Orania.86._bedroom_P.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/7/0/103/576/565/Facade_copyright_Fridolin_Full_P.jpg'], ['https://reisetopia.leonardocontentcloud.com/imageRepo/7/0/103/577/397/Orania.86_livingroom_2_copyright_Fridolin_Full_P.jpg']]
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
Review.delete_all
Hotel.all.each do |hotel|
  puts "destroying #{hotel.name} pics"
  hotel.photos.purge
end
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
  new_hotel = Hotel.create(name: hotel, city: City.last, brand: brands[index], address: addresses[index])
  photos[index].each_with_index do |photo, index1|
    file = URI.open(photo)
    new_hotel.photos.attach(io: file, filename: "#{hotel}#{index1}", content_type: 'image/png')
  end
  Review.create(hotel: new_hotel, title: Faker::Hipster.sentence, content: Faker::Hipster.paragraph)
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
