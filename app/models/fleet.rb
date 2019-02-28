class Fleet < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :fleet_ship
  has_many :ships, through: :fleet_ship

  def league_ships
    self.league.ships
  end
  
end
