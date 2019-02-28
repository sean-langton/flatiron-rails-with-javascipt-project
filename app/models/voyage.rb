class Voyage < ApplicationRecord
  belongs_to :fleet
  belongs_to :ship
end
