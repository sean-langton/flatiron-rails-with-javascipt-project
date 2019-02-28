class Ship < ApplicationRecord
  has_many :fleet_ship
  has_many :fleets, through: :fleet_ship

  @@types = ["Handy Size", "Handymax", "Panamax", "Neopanamax", "Capesize", "Chinamax"]

  def self.types
    @@types
  end

end
