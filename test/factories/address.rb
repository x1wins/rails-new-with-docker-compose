FactoryBot.define do
  factory :address do
    owner_name { Faker::Name.last_name }
    ssn { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    phone1 { Faker::PhoneNumber.phone_number_with_country_code }
    phone2 { Faker::PhoneNumber.phone_number_with_country_code }
    address1 { "#{Faker::Address.street_name} #{Faker::Address.city}" }
    address2 { "#{Faker::Address.secondary_address} #{Faker::Address.street_address}" }
    zipcode { Faker::Address.zip_code }
  end
  factory :to_address, class: ToAddress, parent: :address do
  end
  factory :from_address, class: FromAddress, parent: :address do
  end
end

