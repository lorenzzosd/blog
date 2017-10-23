class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}, :on => :create
  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: { case_sensitive: false }
  
  before_save { self.email = email.downcase }

  has_many :posts, dependent: :destroy
end
