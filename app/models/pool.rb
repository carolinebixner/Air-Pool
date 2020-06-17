class Pool < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reviews
  has_many :available_dates
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 20}
  validates :photos, presence: true, length: {minimum: 2}
end
