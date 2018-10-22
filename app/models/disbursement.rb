class Disbursement < ApplicationRecord
  belongs_to :order
  validates :order, presence: true, uniqueness: true
  validates :amount, presence: true
end
