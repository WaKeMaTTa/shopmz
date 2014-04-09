class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	validates :product_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }

	before_save :set_price_to_products
	before_save :reduce_stock

	private

		def set_price_to_products
			self.price = self.product.price
		end

		def reduce_stock
			Product.update(self.product.id, quantity: (self.product.quantity - self.quantity))
		end
end
