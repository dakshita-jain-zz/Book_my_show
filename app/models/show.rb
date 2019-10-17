class Show < ActiveRecord::Base
  belongs_to :movie
  has_many :bookings
end
