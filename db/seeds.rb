# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  merchants_records = JSON.parse(File.read('./db/merchants.json'))
  puts 'Creating merchants'
  merchants_records.each do |merchant_params|
    Merchant.create!(merchant_params)
  end

  shoppers_records = JSON.parse(File.read('./db/shoppers.json'))
  puts 'Creating shoppers'
  shoppers_records.each do |shopper_params|
    Shopper.create!(shopper_params)
  end

  orders_records = JSON.parse(File.read('./db/orders.json'))
  puts 'Creating orders'
  orders_records.each do |order_params|
    Order.create!(order_params)
  end
end
