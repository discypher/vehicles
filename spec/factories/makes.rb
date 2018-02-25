FactoryBot.define do
  factory :make do
    sequence(:manufacturer) { |n| "Make#{n}" }
  end
end
