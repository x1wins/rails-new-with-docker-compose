FactoryBot.define do
  factory :shipping, class: Shipping do
    association :custom, factory: :custom, strategy: :build
    association :order, factory: :order, strategy: :build
    association :parcel, factory: :parcel, strategy: :build
    association :to_address, factory: :to_address
    association :from_address, factory: :from_address
  end
end