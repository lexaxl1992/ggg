class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "admin"

	def index
		# Хэш данных конкретного товара
		@item = Item.new.get("bedrooms", 2)
		render layout: 'layouts/managment'
	end
end
