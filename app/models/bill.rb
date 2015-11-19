class Bill < ActiveRecord::Base

validates :name, :presence => true, :uniqueness => { :scope => :due_at }

has_many :payments , :class_name => "Payment", :foreign_key => "bill_id"
belongs_to :user

end
