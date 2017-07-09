class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "admin"

	def index
		# Хэш данных конкретного товара
		render layout: 'layouts/managment'
	end
end
