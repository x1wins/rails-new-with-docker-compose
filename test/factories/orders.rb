FactoryBot.define do
  factory :order, class: Order do
    weight { Faker::Number.between(from: 0.00, to: 30.00) }
    order_number { Faker::IDNumber.valid }
    product_name { Faker::Game.title }
    count { Faker::Number.within(range: 1..10) }
    price { Faker::Number.within(range: 100..10000) }
    hs_code { Faker::Number.within(range: 1..3) }
  end
end