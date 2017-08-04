class ItemsController < ApplicationController
  def show
    @item = Item[params[:id]]
    respond_to do |format|
			format.js
		end
  end

	def new
		@windowId = "Ox"+Digest::CRC32.hexdigest(Random.rand(1..100).to_s)
		respond_to do |format|
			format.js
		end
	end

	def edit
		@item = Item[params[:id]]
		respond_to do |format|
			format.js
		end
	end

	def create
		lambda = params[:item]
		item_params = lambda

		new_fileName = Digest::CRC32.hexdigest(item_params[:name])+".png"
		# Сохранение загруженной миниатюры
		unless item_params[:thumbnail] == nil
			uploaded_file = item_params[:thumbnail]
	    File.open(Rails.root.join('public', 'uploads', 'items', 'thumbs', new_fileName), 'wb') do |file|
	      file.write(uploaded_file.read)
	    end
	    # и запись пути к ней в базу данных
			lambda = item_params.merge({"thumbnail": "/uploads/items/thumbs/"+new_fileName})
		end

		@item = Item.create(lambda)
		@item.update(category: Category[params[:category_id][0]])

		unless params[:img_ids] == nil
			params[:img_ids].each do |image_id|
				Image[image_id].update(item: @item)
			end
		end

		respond_to do |format|
			if @item.save
				format.js
			else
				format.html {notice:$custom_error_msg}
			end
		end
	end

	def update
		@item = Item[params[:item_id][0]]
		@item.update(params[:item])
		respond_to do |format|
			if @item.save
				format.js
			else
				format.html {notice:$custom_error_msg}
			end
		end
	end

	def destroy
		@item = Item[params[:id]]
		@item.delete
		respond_to do |format|
			if @item.delete
				format.js
			else
				format.html {notice:$custom_error_msg}
			end
		end
	end
end
