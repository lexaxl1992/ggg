class Item
	# В базе данных под номером "2" под каждым ключом
	# хранится json-документ с данными товаров категории
	Items = Redis.new(host: "127.0.0.1", port: 3100, db: 2)

	def get_all(category_name)
		# Метод принимает имя категории,
		# получает json-документ по ключу с именем категории
		# и возвращает руби-хэш с данными всех товаров выбранной категории
		return JSON.parse((Items.get category_name), "symbolize_names": true) unless (Items.get category_name) == nil
	end

	def get(category_name, item_id)
		# Метод принимает идентификатор товара,
		# ищет товар с совпадающим с ним значением ключа "id"
		# и возвращает хэш данных выбранного товара
		get_all(category_name).each do |item|
			return item if item.values_at(:id)[0] == item_id
		end
	end
end
