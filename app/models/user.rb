class User < ActiveRecord::Base
  attribute :email
  attribute :hashed_password

  attr_accessible :email

  validates :email, presence: true
end
