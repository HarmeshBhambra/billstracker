class Payment < ActiveRecord::Base

  belongs_to :bill , :class_name => "Bill", :foreign_key => "bill_id"
end
