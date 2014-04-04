class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_items

	#include ActiveModel::Validations
	#validates_with ProductCategoryValidator
	validates_presence_of :name
	validates_uniqueness_of :name
	validates_presence_of :quantity
	validates_numericality_of :quantity
	validates_presence_of :registred_at
	validates_presence_of :price
	validates_numericality_of :price
end
