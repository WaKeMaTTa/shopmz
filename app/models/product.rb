class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_items

	# Validates for form create and update products
	validates :name, :quantity, :registred_at, :price, presence: true
	validates :name, uniqueness: true
	validates :quantity, numericality: { only_integer: true }
	validates :price, numericality: true
	validates :category, inclusion: { in: PERMITTED_CATEGORIES, 
		message: "'%{value}' is not valid category." }, allow_blank: true

	# Scope's for filter products
	scope :by_category, -> category { where(category: category) }

	scope :by_manufacturer, -> manufacturer { where(manufacturer: manufacturer) }

	scope :registred_at, -> registred_at { where("registred_at > ?", registred_at) }
	
	scope :more_quantity, -> quantity { where("quantity > ?", quantity) }
	scope :less_quantity, -> quantity { where("quantity < ?", quantity) }
	
	scope :more_price, -> price { where("price > ?", price) }
	scope :less_price, -> price { where("price < ?", price) }
end
