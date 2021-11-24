class Hotel < ApplicationRecord
  belongs_to :city
  has_many :rooms
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_city,
  against: [ :address ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
