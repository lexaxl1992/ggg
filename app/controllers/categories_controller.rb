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
		# Генерация индекса категории
		lambda = params[:category].merge({"index": Digest::CRC32.hexdigest(params[:category][:label])})
		category_params = lambda

		# Сохранение загруженной иконки
		unless category_params[:icon] == nil
			uploaded_file = category_params[:icon]
	    File.open(Rails.root.join('public', 'uploads', 'categories', category_params[:index]+".png"), 'wb') do |file|
	      file.write(uploaded_file.read)
	    end
	    # и запись пути к ней в базу данных
			lambda = category_params.merge({"icon": "/uploads/categories/"+category_params[:index]+".png"})
		end

		@category = Category.create(lambda)

		respond_to do |format|
			if @category.save
				format.js
			else
				format.js {render "error"}
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
				format.js {render "error"}
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
				format.js {render "error"}
			end
		end
	end
end
