class Category
	# Установка подключения к локальной базе данных под номером "1" 
	Categories = Redis.new(host: "127.0.0.1", port: 3100, db: 1)

	def get_all
		# Метод получает из базы данных json-документ по ключу "categories"
		# и возвращает его в виде массива с хэшами данных всех категорий
		return JSON.parse((Categories.get "categories"), "symbolize_names": true)
	end

	def get(category_name)
		# Метод принимает имя категории,
		# получает хэш данных всех категорий
		# и возвращает хэш данных выбранной категории
		return get_all[:"#{category_name}"]
	end
end
