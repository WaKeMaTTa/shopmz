class Order < ActiveRecord::Base
	has_many :line_items
	has_many :products, through: :line_items
	accepts_nested_attributes_for :line_items, :allow_destroy => true, :reject_if => lambda { |li| li[:product_id].blank? or li[:quantity].blank? or li[:price].blank? }

	validates :customer_name, :delivery_city, :delivery_address, :payment_method, :status, presence: true
	validates :status, inclusion: { in: %w(pending sent received), message: "'%{value}' is not valid status." }
	validates :payment_method, inclusion: { in: %w(cash card paypal), message: "'%{value}' is not valid payment method." }
end
