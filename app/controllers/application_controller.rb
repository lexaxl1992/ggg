class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  	# Получение массива с хэшами данных категорий
	$categories =  Category.new.get_all("object")
end
