FactoryBot.define do
  factory :shopper do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    nif { Faker::IDNumber.spanish_citizen_number }
  end
end
