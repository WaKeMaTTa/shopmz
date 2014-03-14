class LineItem < ActiveRecord::Base
	belongs_to :order
	has_many :product
end
