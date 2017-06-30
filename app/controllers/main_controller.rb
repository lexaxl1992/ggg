class MainController < ApplicationController
	def index
		@bedrooms = Category.new.get_body("bedrooms")
		render 'index'
	end

	def about
		render 'about'
	end
end
