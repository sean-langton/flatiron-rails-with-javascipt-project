class Ship < ApplicationRecord

  @@sizes = ["Handy Size", "Handymax", "Panamax", "Neopanamax", "Capesize", "Chinamax"]
  
  has_many :voyages
  has_many :fleets, through: :voyages
  validates :name, presence: true
  validates :size, inclusion: { in: @@sizes}
  validates :max_cargo, :max_distance, numericality: true


  def self.sizes
    @@sizes
  end

  def available(fleet)
    !fleet.league.ships.include?(self) && !fleet.ships.find_by(size: self.size)
  end

end
