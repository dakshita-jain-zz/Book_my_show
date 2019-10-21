class Movie < ActiveRecord::Base
  has_many :shows
  has_many :bookings, through: :shows
  validates :name, presence: true,uniqueness: true,length: { maximum: 50 }
  validates :release_date, presence: true
  validates :rating,  numericality: {greater_than_or_equal_to: 1}, presence: true
end
