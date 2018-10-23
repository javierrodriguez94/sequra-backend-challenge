FactoryBot.define do
  factory :order do
    merchant { FactoryBot.create(:merchant) }
    shopper { FactoryBot.create(:shopper) }
    amount { 1.5 }
    completed_at { nil }
  end
end
