class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	validates :product_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }

	before_save :set_price_to_products
	before_save :call_reduce_stock
	
	private

		def set_price_to_products
			self.price = self.product.price
		end

		def call_reduce_stock
			self.product.reduce_stock(self.quantity)
		end
end
