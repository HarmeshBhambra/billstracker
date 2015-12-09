class AddTypeToBillTypes < ActiveRecord::Migration
  def change
    add_column :bill_types, :type, :string
  end
end
