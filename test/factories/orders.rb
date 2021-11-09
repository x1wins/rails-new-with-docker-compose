weight = Faker::Number.decimal_part(digits: 2).to_f + Faker::Number.decimal_part(digits: 2).to_f / 100
price_per_lb = 1.5
default_price = 6
default_lb = 1
additional_price = (weight - default_lb).ceil * price_per_lb
price = default_price + additional_price
FactoryBot.define do
  factory :order, class: Order do
    weight { weight }
    order_number { Faker::IDNumber.valid }
    product_name { Faker::Game.title }
    count { Faker::Number.within(range: 1..3) }
    price { price }
    hs_code { Faker::Number.within(range: 1..3) }
  end
end