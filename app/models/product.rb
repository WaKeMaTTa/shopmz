class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_items

	validates :name, :quantity, :registred_at, :price, presence: true
	validates :name, uniqueness: true
	validates :quantity, numericality: { only_integer: true }
	validates :price, numericality: true
	validates :category, inclusion: { in: %w(books music movies electronics home toys clothing comestible), 
		message: "'%{value}' is not valid category." }, allow_blank: true
end
