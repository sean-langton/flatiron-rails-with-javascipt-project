class Voyage < ApplicationRecord
  belongs_to :fleet
  belongs_to :ship

  validates :dep_port, :arr_port, presence: true
#  validates_with CapacityValidator
  scope :most_recent, -> { order("voyages.created_at DESC").limit(5) }

end
