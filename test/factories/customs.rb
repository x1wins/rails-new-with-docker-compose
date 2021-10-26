FactoryBot.define do
  factory :custom do
    customs_type { Faker::Number.within(range: 1..3) }
    recipient_type { Faker::Number.within(range: 1..3) }
  end
end