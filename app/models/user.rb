class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: true
  has_many :bookings
  def self.current
    Thread.current[:user]
  end

  def make_current
    Thread.current[:user] = self
  end
end
