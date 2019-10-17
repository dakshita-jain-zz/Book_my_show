class Show < ActiveRecord::Base
  belongs_to :movie
  has_many :bookings
  validates :price,  numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :venue, presence: true,length: { maximum: 50 }
  validates :showtime, presence: true
end
