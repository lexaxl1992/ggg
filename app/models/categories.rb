class Categories
	# В базе данных под номером "1" под единственным ключом
	# хранится json-документ с данными категорий
	Categories = Redis.new(host: "127.0.0.1", port: 3100, db: 1)

	def get
		# Метод получает json-документ по ключу "categories",
		# и возвращает его в виде массива с хэшами данных категорий
		return JSON.parse((Categories.get "categories"), "symbolize_names": true)
	end
end
