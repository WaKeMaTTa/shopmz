module ProductsHelper
	def get_manufacturers(with_blank_option = false)
		if with_blank_option == false
			manufacturers = []
		else
			manufacturers = ['']
		end

		manufacturers += Product.select("manufacturer").map {|i| i.manufacturer }

		return manufacturers
	end
end
