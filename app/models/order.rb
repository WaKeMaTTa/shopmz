class Order < ActiveRecord::Base
	has_many :product
	has_many :line_item
end
