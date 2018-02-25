class Make < ApplicationRecord
  has_many :models
  has_many :vehicles, through: :models

  validates :manufacturer,
            presence: true,
            uniqueness: true
end
