FactoryBot.define do
  factory :vehicle do
    sequence(:kind) { |n| "vehicle#{n}" }

    factory :car do
      sequence(:kind) { |n| "car#{n}" }
    end

    factory :truck do
      sequence(:kind) { |n| "truck#{n}" }
    end
  end
end
