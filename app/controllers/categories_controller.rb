class CategoriesController < ApplicationController
	def show
		@category = Category[params[:id]]
	end

	def new
		respond_to do |format|
			format.js
		end
	end

	def edit
		@category = Category[params[:id]]
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
				format.html {notice:$custom_error_msg}
			end
		end
	end

	def update
		@category = Category[params[:category_id][0]]
		@category.update(params[:category])
		respond_to do |format|
			if @category.save
				format.js
			else
				format.html {notice:$custom_error_msg}
			end
		end
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
