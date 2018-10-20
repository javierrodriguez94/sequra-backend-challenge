FactoryBot.define do
  factory :merchant do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    cif { Faker::Finance.vat_number() }
  end
end
