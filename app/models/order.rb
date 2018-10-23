class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  has_one :disbursement

  validates :merchant, presence: true
  validates :shopper, presence: true
  validates :amount, presence: true

  scope :completed, -> { where('completed_at is not null') }
  scope :not_disbursed, -> { includes(:disbursement).where(disbursements: { id: nil }) }
end
