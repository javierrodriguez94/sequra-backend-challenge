FactoryBot.define do
  factory :merchant do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    cif { Faker::Company.spanish_organisation_number }
  end
end
