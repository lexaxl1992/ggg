class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
	end

	def new
		respond_to do |format|
			format.js
		end
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def create
		# генерация индекса категории
		data = params[:category].merge({"index": Digest::CRC32.hexdigest(params[:category][:label])})
		@category = Category.create(data)
		@category.save
		respond_to do |format|
			if @category.save
				format.js
			else
				format.html {render action:"new", notice:"При записи данных произошла ошибка."}
			end
		end
	end

	def update

	end

	def destroy
		@category = Category[params[:id]]
		@category_index = @category.index
		@category.delete
		respond_to do |format|
			if @category.delete
				format.js
			else
				format.html {notice:"При удалении данных произошла ошибка."}
			end
		end
	end
end
