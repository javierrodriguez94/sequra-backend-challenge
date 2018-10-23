module DisbursementService
  class << self
    def create(order)
      raise ArgumentError.new 'Can not create a disbursement for a non completed order' unless order.completed_at?
      amount = order.amount
      amount_with_fee = amount + calculate_fee(amount)
      Disbursement.new(order: order, amount: amount_with_fee)
    end

  private

    def calculate_fee(amount)
      fee_to_apply = fees_ranges(amount)
      amount * fee_to_apply
    end

    def fees_ranges(amount)
      case amount
      when 0...50
        0.01
      when 50..300
        0.0095
      else
        0.0085
      end
    end
  end
end
