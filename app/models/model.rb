class Model < ApplicationRecord
  belongs_to :vehicle
  belongs_to :make

  validates :name, presence: true
  validates :base_cost, numericality: { greater_than: 0.0 }
end
