FactoryBot.define do
  factory :disbursement do
    order { FactoryBot.create(:order, amount: 10) }
    amount { 10.1 }
  end
end
