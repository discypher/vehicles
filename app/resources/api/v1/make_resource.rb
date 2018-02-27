module Api::V1
  class MakeResource < JSONAPI::Resource
    attributes :manufacturer

    has_many :models
  end
end
