class Order < ActiveRecord::Base
	has_many :line_items
	has_many :products, through: :line_items
	accepts_nested_attributes_for :line_items, :allow_destroy => true, :reject_if => lambda { |li| li[:product_id].blank? or li[:quantity].blank? }

	validates :customer_name, :delivery_city, :delivery_address, :payment_method, presence: true
	validates :status, presence: true, on: :update
	validates :status, inclusion: { in: PERMITTED_STATUS_ORDER, message: "'%{value}' is not valid status." }, on: :update
	validates :payment_method, inclusion: { in: PERMITTED_PAYMENT_METHOD, message: "'%{value}' is not valid payment method." }

	before_create :set_order_status_pending, on: :create

	private

		def set_order_status_pending
			self.status = "pending"
		end
end
