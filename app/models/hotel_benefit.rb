class HotelBenefit < ApplicationRecord
  belongs_to :room
  belongs_to :benefit
end
