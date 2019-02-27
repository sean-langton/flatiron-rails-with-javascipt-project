class User < ApplicationRecord
  has_secure_password
  validates :username, :email, uniqueness: true, presence: true

  has_many :fleets
end
