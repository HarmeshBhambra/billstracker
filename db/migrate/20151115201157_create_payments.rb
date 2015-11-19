class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :paid_at
      t.float :amount_paid
      t.integer :bill_id

      t.timestamps

    end
  end
end
