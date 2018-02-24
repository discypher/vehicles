class Vehicle < ApplicationRecord
  validates :kind,
            presence: true,
            uniqueness: true
end
