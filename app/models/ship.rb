class Ship < ApplicationRecord
  has_many :fleet_ship
  has_many :ships, through: :fleet_ship
end
