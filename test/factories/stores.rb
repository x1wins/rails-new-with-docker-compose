require 'faker'

company = Faker::Company
FactoryBot.define do
  factory :store do
    name { company.name }
    logo { company.logo }
    lockable { false }
  end
end