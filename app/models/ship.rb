class Ship < ApplicationRecord
  has_many :voyages
  has_many :fleets, through: :voyages

  @@sizes = ["Handy Size", "Handymax", "Panamax", "Neopanamax", "Capesize", "Chinamax"]

  def self.sizes
    @@sizes
  end

  def available(fleet)
    !fleet.league.ships.include?(self) && !fleet.ships.find_by(size: self.size)
  end

end
