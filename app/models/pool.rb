class Pool < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :reviews
  has_many :available_dates
  has_many :bookings
end
