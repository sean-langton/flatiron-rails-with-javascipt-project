class Fleet < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :fleet_ship
  has_many :ships, through: :fleet_ship
end
