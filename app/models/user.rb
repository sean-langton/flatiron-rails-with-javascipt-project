class User < ApplicationRecord
  has_secure_password validations: false
  validates :username, :email, uniqueness: true, presence: true
  validates :password, presence: true, unless: :uid

  def uid
    uid
  end
end
