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
		# Сгенерировать индекс категории и добавить его в хэш параметров
		lambda = params[:category].merge({"index": Digest::CRC32.hexdigest(params[:category][:label])})

		# Если был передан файл иконки,
		unless lambda[:icon] == nil
			category_params = lambda
			uploaded_file = category_params[:icon]
	    File.open(Rails.root.join('public', 'uploads', 'categories', category_params[:index]+".png"), 'wb') do |file|
	    	# то записать её на диск по заданному пути
	      file.write(uploaded_file.read)
	    end
	    # и записать её относительный путь для url в хэш
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
		@category = Category[params[:categoryId]]
		lambda = params[:category]

		# Если был передан файл иконки,
		unless lambda[:icon] == nil
			category_params = lambda
			uploaded_file = category_params[:icon]
	    File.open(Rails.root.join('public', 'uploads', 'categories', @category.index+".png"), 'wb') do |file|
	    	# то записать её на диск по заданному пути
	      file.write(uploaded_file.read)
	    end
	    # и записать её относительный путь для url в хэш
			lambda = category_params.merge({"icon": "/uploads/categories/"+@category.index+".png"})
		end

		@category.update(lambda)
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
