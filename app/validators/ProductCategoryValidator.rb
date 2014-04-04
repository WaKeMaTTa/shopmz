class ProductCategoryValidator < ActiveModel::Validator
	def validate(record)
		valid_categories = %w(books music movies electronics home toys clothing comestible)
		is_correct_value = false

		if record.cateogry.blank?
			is_correct_value = true
		else
			valid_categories.each do |valid_category| 
				if record.category.include? valid_category
					is_correct_value = true
				end
			end
		end

		if is_correct_value == false
			record.errors.add :base, "Cateogry is not allowed"
		end
	end
end
