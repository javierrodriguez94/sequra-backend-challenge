class Disbursement < ApplicationRecord
  belongs_to :order
  validates :order, presence: true, uniqueness: true
  validates :amount, presence: true

  scope :by_merchant, -> (merchant_id) do
    joins(:order).where('orders.merchant_id = ?', merchant_id)
  end
  scope :by_week_number, -> (week_number, year) do
    week_start_date = Date.commercial(year.to_i, week_number.to_i, 1)
    week_end_date = week_start_date + 7.days
    where("disbursements.created_at >= ? and disbursements.created_at <= ?", week_start_date, week_end_date)
  end
end
