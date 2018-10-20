# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#initialize' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:order).save).to be true
    end

    it 'initializes a new order with correct params' do
      order = FactoryBot.build(:order)
      expect(order).to be_an_instance_of described_class
      expect(order).to be_valid
    end

    it 'is not valid without amount' do
      expect(FactoryBot.build(:order, amount: nil)).to_not be_valid
    end

    it 'is not valid without a merchant' do
      expect(FactoryBot.build(:order, merchant: nil)).to_not be_valid
    end

    it 'is not valid without shopper' do
      expect(FactoryBot.build(:order, shopper: nil)).to_not be_valid
    end
  end
end
