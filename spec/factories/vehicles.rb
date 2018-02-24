FactoryBot.define do
  factory :vehicle do
    kind 'Unknown'

    factory :car do
      kind 'Car'
    end

    factory :truck do
      kind 'Truck'
    end
  end
end
