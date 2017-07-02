class MainController < ApplicationController
	def index
		# Получение массива с хэшами данных категорий
		@categories =  Categories.new.get
		render 'index'
	end

	def about
		render 'about'
	end
end
