class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "1234"

	def index
		render layout: "layouts/managment"
	end
end
