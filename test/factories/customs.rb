FactoryBot.define do
  factory :custom do
    customs_type { Faker::Number.within(range: 1..2) }
    recipient_type { Faker::Number.within(range: 1..2) }
  end
end