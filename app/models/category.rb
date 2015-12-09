class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => { :scope => :name }

  has_many :bills
end
