class DropBillTypes < ActiveRecord::Migration
  def change
    drop_table :bill_types
  end
end
