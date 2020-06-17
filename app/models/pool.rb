class Pool < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reviews
  has_many :available_dates
  has_many :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
