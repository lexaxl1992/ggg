class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "admin", except: :index

	def index
		# Массив с хэшами данных категорий
		@categories =  Category.new.get_all
		# Хэш данных конкретного товара
		@item = Item.new.get("bedrooms", 2)
		render layout: 'layouts/managment'
	end
end
