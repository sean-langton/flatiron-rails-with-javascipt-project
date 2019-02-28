class Ship < ApplicationRecord
  has_many :fleet_ship
  has_many :fleets, through: :fleet_ship

  @@sizes = ["Handy Size", "Handymax", "Panamax", "Neopanamax", "Capesize", "Chinamax"]

  def self.sizes
    @@sizes
  end

  def available(fleet)
    !fleet.league.ships.include?(self) && !fleet.ships.find_by(size: self.size)
  end

end
