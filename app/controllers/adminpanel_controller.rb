class AdminpanelController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "admin", except: :index

	def index
		render layout: 'layouts/managment'
	end
end