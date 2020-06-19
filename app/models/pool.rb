class Pool < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reviews
  has_many :available_dates
  has_many :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: {minimum: 20}
  validates :photos, presence: true, length: {minimum: 2}
  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [:location],
    using: {
      tsearch: { prefix: true }
  }
end
