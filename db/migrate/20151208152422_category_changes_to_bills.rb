class CategoryChangesToBills < ActiveRecord::Migration
  def change
    add_column :bills, :category_id, :integer
    remove_column :bills, :category
  end
end
