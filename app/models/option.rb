class Option < ApplicationRecord
  has_and_belongs_to_many :models

  validates :cost, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :description, presence: true
end
