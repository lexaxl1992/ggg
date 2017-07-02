class Items
	# В базе данных под номером "2" под каждым ключом
	# хранится json-документ с данными товаров категории
	Items = Redis.new(host: "127.0.0.1", port: 3100, db: 2)

	def get(category_name)
		# Метод получает json-документ по ключу с именем категории
		# и возвращает руби-хэш с данными товаров категории
		return JSON.parse((Items.get category_name), "symbolize_names": true) unless (Items.get category_name) == nil
	end
end
