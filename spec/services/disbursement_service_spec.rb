# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisbursementService do
  let(:completed_order) { FactoryBot.create(:order, completed_at: DateTime.now) }
  let(:order_10) { FactoryBot.create(:order, completed_at: DateTime.now, amount: 10) }
  let(:order_100) { FactoryBot.create(:order, completed_at: DateTime.now, amount: 100) }
  let(:order_500) { FactoryBot.create(:order, completed_at: DateTime.now, amount: 500) }
  let(:completed_order) { FactoryBot.create(:order, completed_at: DateTime.now) }
  let(:incompleted_order) { FactoryBot.create(:order) }

  describe '#create' do
    it 'creates a disbursement with a completed order' do
      disbursement = described_class.create(completed_order)
      expect(disbursement).to be_an_instance_of(Disbursement)
      expect(disbursement.order).to eq completed_order
    end

    it 'raises an exception if the order is not complete' do
      expect { described_class.create(incompleted_order) }.to raise_error(ArgumentError)
    end

    it 'calculates the correct fee' do
      expect(described_class.create(order_10).amount).to eq 10.1
      expect(described_class.create(order_100).amount).to eq 100.95
      expect(described_class.create(order_500).amount).to eq 504.25
    end
  end
end
