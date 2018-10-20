# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shopper, type: :model do
  let(:invalid_email) { 'email' }
  
  describe '#initialize' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:shopper).save).to be true
    end

    it 'initializes a new shopper with correct params' do
      shopper = FactoryBot.build(:shopper)
      expect(shopper).to be_an_instance_of described_class
      expect(shopper).to be_valid
    end

    it 'is not valid without name' do
      expect(FactoryBot.build(:shopper, name: nil)).to_not be_valid
    end

    it 'is not valid without a valid email' do
      expect(FactoryBot.build(:shopper, email: invalid_email)).to_not be_valid
      expect(FactoryBot.build(:shopper, email: nil)).to_not be_valid
    end

    it 'is not valid without nif' do
      expect(FactoryBot.build(:shopper, nif: nil)).to_not be_valid
    end
  end
end
