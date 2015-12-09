class Bill < ActiveRecord::Base

validates :name, :presence => true, :uniqueness => { :scope => :due_at }
validates :amount, :presence => true
validates :due_at, :presence => true
validates :category, :presence => true
validates :user, :presence => true

has_many :payments , :class_name => "Payment", :foreign_key => "bill_id", :dependent => :destroy
belongs_to :user
belongs_to :category

mount_uploader :image, ImageUploader

end
