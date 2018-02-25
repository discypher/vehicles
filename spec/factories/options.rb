FactoryBot.define do
  factory :option do
    cost 1.5
    sequence(:name) { |n| "Option #{n}" }
    description "Does some stuff."
  end
end
