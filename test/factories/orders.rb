FactoryBot.define do
  factory :order, class: Order do
    weight { Faker::Number.decimal_part(digits: 2).to_f + Faker::Number.decimal_part(digits: 2).to_f / 100 }
    order_number { Faker::IDNumber.valid }
    product_name { Faker::Game.title }
    count { Faker::Number.within(range: 1..10) }
    price { Faker::Number.within(range: 1..300) }
    hs_code { Faker::Number.within(range: 1..3) }
  end
end