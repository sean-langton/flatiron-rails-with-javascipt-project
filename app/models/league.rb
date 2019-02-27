class League < ApplicationRecord
  validates :name, presence: true
  validated :num_of_fleets, numericality: {greater_than: 0, less_than_or_equal_to: 12}
end
