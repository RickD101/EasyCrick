class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: { message: 'already exists.' }
  validates :username, :password_digest, presence: true
end
