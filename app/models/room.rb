class Room < ApplicationRecord
  belongs_to :hotel
  has_many :hotel_benefits
  has_many :benefits, through: :hotel_benefits
  has_many :room_amenities
  has_many :amenities, through: :room_amenities
end
