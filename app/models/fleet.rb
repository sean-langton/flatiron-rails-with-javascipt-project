class Fleet < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :voyages
  has_many :ships, through: :voyages

  def league_ships
    self.league.ships
  end

end
