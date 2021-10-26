FactoryBot.define do
  factory :parcel, class: Parcel do
    box_count { Faker::Number.within(range: 1..10) }
    memo { Faker::Lorem.sentence(word_count: 5) }
    status { Faker::Number.within(range: 1..3) }
  end
end

