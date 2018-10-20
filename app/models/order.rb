class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  validates :merchant, presence: true
  validates :shopper, presence: true
  validates :amount, presence: true
end
