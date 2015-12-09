class Payment < ActiveRecord::Base
  validates :bill, :presence => true
  validates :paid_at, :presence => true
  validates :amount_paid, :presence => true

  belongs_to :bill , :class_name => "Bill", :foreign_key => "bill_id"
end
