# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:invalid_email) { 'email' }

  describe '#initialize' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:merchant).save).to be true
    end

    it 'initializes a new merchant with correct params' do
      merchant = FactoryBot.build(:merchant)
      expect(merchant).to be_an_instance_of described_class
      expect(merchant).to be_valid
    end

    it 'is not valid without name' do
      expect(FactoryBot.build(:merchant, name: nil)).to_not be_valid
    end

    it 'is not valid without a valid email' do
      expect(FactoryBot.build(:merchant, email: invalid_email)).to_not be_valid
      expect(FactoryBot.build(:merchant, email: nil)).to_not be_valid
    end

    it 'is not valid without cif' do
      expect(FactoryBot.build(:merchant, cif: nil)).to_not be_valid
    end
  end
end
