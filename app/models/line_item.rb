class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	validates :product_id, :quantity, :price, presence: true
	validates :quantity, numericality: { only_integer: true }
	validates :price, numericality: true
end
