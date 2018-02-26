class Make < ApplicationRecord
  has_many :models

  validates :manufacturer,
            presence: true,
            uniqueness: true
end
