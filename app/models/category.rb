class Category
	def get_body(name)
		return JSON.parse(Items.get name)
	end
end
