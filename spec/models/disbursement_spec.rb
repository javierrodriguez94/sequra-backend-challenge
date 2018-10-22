require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  describe '#initialize' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:disbursement).save).to be true
    end

    it 'initializes a new disbursement with correct params' do
      disbursement = FactoryBot.build(:disbursement)
      expect(disbursement).to be_an_instance_of described_class
      expect(disbursement).to be_valid
    end

    it 'is not valid without order' do
      expect(FactoryBot.build(:disbursement, order: nil)).to_not be_valid
    end

    it 'is not valid if exist one disbursement with the same order' do
      order = FactoryBot.create(:order)
      FactoryBot.create(:disbursement, order: order)
      expect(FactoryBot.build(:disbursement, order: order)).to_not be_valid
    end

    it 'is not valid without amount' do
      expect(FactoryBot.build(:disbursement, amount: nil)).to_not be_valid
    end
  end
end
