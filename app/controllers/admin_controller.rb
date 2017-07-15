class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "admin"

	def index
		render layout: "layouts/managment"
	end

	def constructor
	end
end
