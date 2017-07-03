class MainController < ApplicationController
	def index
		render 'index'
	end

	def about
		render 'about'
	end

	def construct
		render 'constructor'
	end
end
