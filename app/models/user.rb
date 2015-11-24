class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
