require 'rails_helper'

RSpec.describe GenerateDisbursementsJob, type: :job do
  let!(:order1) { FactoryBot.create(:order, completed_at: DateTime.now) }
  let!(:order2) { FactoryBot.create(:order, completed_at: DateTime.now) }
  let!(:order3) { FactoryBot.create(:order) }

  it 'calls DisbursementService only with completed orders' do
    expect(DisbursementService).to receive(:create).with(order1)
    expect(DisbursementService).to receive(:create).with(order2)
    described_class.perform_now
  end
end
