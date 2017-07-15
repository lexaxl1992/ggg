class Item
	# В базе данных под номером "2" под каждым ключом
	# хранится json-документ с данными товаров категории
	Items = Redis.new(host: "127.0.0.1", port: 3100, db: 2)

	def get_all(category_id, format)
		# Метод принимает имя категории,
		# получает json-строку по ключу с именем категории
		# и возвращает руби-хэш с данными всех товаров выбранной категории
		return JSON.parse(Items.get(category_id), "symbolize_names": true) unless (Items.get(category_id)) == nil
	end

	def get(category_id, item_id)
		# Метод принимает идентификатор товара,
		# выбирает из него хэш по значению ключа идентификатора товара
		# и возвращает его
		get_all(category_id, "object").each do |item|
			return item if item.values_at(:id)[0] == item_id
		end
	end

	def set_all(category_id, items)
		Items.set(category_id, items.to_json)
	end
end
