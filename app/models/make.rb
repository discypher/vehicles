class Make < ApplicationRecord
  validates :manufacturer,
            presence: true,
            uniqueness: true
end
