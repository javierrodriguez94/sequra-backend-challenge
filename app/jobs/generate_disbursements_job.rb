class GenerateDisbursementsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    orders = Order.not_disbursed.completed
    orders.each do |order|
      DisbursementService.create(order)
    end
  end
end
