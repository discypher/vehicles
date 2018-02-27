class Vehicle < ApplicationRecord
  belongs_to :make
  belongs_to :model
  has_and_belongs_to_many :options

  validates :make, presence: true
  validates :model, presence: true
  validates :owner, presence: true
  validates :miles, presence: true
  validates :vin, presence: true
  validates :condition, presence: true
end
