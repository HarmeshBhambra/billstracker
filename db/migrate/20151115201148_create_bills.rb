class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :image
      t.integer :user_id
      t.text :notes
      t.string :recurring
      t.datetime :due_at
      t.float :amount
      t.string :category
      t.string :company
      t.string :name

      t.timestamps

    end
  end
end
