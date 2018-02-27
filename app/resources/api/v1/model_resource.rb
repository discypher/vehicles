module Api::V1
  class ModelResource < JSONAPI::Resource
    attributes :name,
               :base_cost,
               :year

    belongs_to :make
    has_many :options, acts_as_set: true
  end
end
