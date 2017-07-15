require "hashids_module"

class Category
	include Hashids_module
	# Установка подключения к локальной базе данных под номером "1" 
	Categories = Redis.new(host: "127.0.0.1", port: 3100, db: 1)

	def get_all(format)
		# Метод принимает формат представления ответа,
		# и если данные запрошены в виде руби-объекта,
		if format == "object"
			# то получает из базы данных json-строку по ключу "categories"
			# и возвращает её в виде массива с хэшами данных всех категорий,
			return JSON.parse((Categories.get "categories"), "symbolize_names": true)
		# иначе если данные запрошены в виде json-строки,
		elsif format == "json"
			# то получает из базы данных json-строку по ключу "categories"
			# и возвращает её
			return Categories.get "categories"
		end
	end

	# Метод принимает идентификатор категории и формат представления ответа,
	def get(category_id, format)
		# получает хэш данных всех категорий вызовом метода get_all,
		get_all("object").each do |category|
			# и если данные запрошены в виде руби-объекта,
			if format == "object"
				# то выбирает из него хэш по значению ключа идентификатора категории
				# и возвращает его,
				return category if category.values_at(:id)[0] == category_id
			# иначе если данные запрошены в виде json-строки,
			elsif format == "json"
				# то выбирает из него хэш по значению ключа идентификатора категории
				# и возвращает его в виде json-документа
				return category.to_json if category.values_at(:id)[0] == category_id
			end
		end
	end

	def set_all(categories_hash)
		Categories.set("categories", categories_hash.to_json)
	end

	# Метод получает хэш данных категории
	def set(category_hash)
		# и если категория с таким идентификатором существует,
		unless get(category_hash[:id]).nil?
			# то перезаписывает его в базу данных,
			set_all(get_all.map {|category| (
				category = category_hash if category.values_at(:id)[0] == category_hash[:id]
			)})
		# иначе создаёт в ней новую запись,
		else
			# генерируя значение ключа идентификатора
			category_hash[:id] = hashids.encode(category[:label])
			set_all(get_all.push(category_hash))
		end
	end
end
