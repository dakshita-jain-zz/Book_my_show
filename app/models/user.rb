class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: true
  validates :password,presence: true
  has_many :bookings
  has_attached_file :photo,:styles => { :small => "150x150>" }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  def self.current
    Thread.current[:user]
  end

  def self.reset_current
    Thread.current[:user] = nil
  end

  def make_current
    Thread.current[:user] = self
  end

  def admin?
    self.email == "admin@gmail.com" ? true : false
  end

end
