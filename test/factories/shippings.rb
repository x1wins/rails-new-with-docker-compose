FactoryBot.define do
  factory :shipping do
    association :to_address, factory: :to_address
    association :from_address, factory: :from_address
  end
end