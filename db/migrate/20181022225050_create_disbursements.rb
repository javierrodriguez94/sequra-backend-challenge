class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.references :order, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
