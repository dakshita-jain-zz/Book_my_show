class User < ActiveRecord::Base
  has_secure_password
  has_many :bookings

  def self.current
    Thread.current[:user]
  end

  def make_current
    Thread.current[:user] = self
  end
end
