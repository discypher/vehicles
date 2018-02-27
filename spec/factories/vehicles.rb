FactoryBot.define do
  factory :vehicle do
    make
    model
    sequence(:vin) { |n| "abc#{n}1234fdsajkl3" }
    sequence(:owner) { |n| "Joe Smith #{n}" }
    miles 100_000
    condition "Like New"

    factory :vehicle_with_options do
      after(:create) do |vehicle, evaluator|
        create_list(:option, evaluator.option_count, vehicle: vehicle)
      end
    end
  end
end
