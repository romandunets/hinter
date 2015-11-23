class User < ActiveRecord::Base
  attr_accessor :email

  validates :email, presence: true
end
