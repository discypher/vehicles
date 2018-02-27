module Api::V1
  class VehicleResource < JSONAPI::Resource
    attributes :vin,
               :owner,
               :miles,
               :condition

    belongs_to :make
    belongs_to :model
    has_many :options, acts_as_set: true
  end
end
