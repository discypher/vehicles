module Api::V1
  class OptionResource < JSONAPI::Resource
    attributes :cost,
               :name,
               :description

    has_many :models
    has_many :vehicles
  end
end
