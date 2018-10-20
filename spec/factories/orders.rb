FactoryBot.define do
  factory :order do
    merchant { FactoryBot.create(:merchant) }
    shopper { FactoryBot.create(:shopper) }
    amount { 1.5 }
  end
end
