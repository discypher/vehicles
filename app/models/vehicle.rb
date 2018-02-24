class Vehicle < ApplicationRecord
  validates :kind, presence: true
end
