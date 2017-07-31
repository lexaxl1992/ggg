class ImagesController < ApplicationController
	def show
		@image = Image[params[:id]]
	end

	def new
		respond_to do |format|
			format.js
		end
	end

	def create
		uploadedFile = params[:file]
		new_fileName = Digest::CRC32.hexdigest(uploadedFile.original_filename)+".png"
		File.open(Rails.root.join('public', 'uploads', 'items', 'images', new_fileName), 'wb') do |file|
			file.write(uploadedFile.read)
		end

		@image = Image.create("url": "/uploads/items/images/"+new_fileName)

		respond_to do |format|
			if @image.save
				format.js
			else
				format.html {notice:$custom_error_msg}
			end
		end
	end

	def destroy
		@image_id = params[:id]
		@image = Image[@image_id]
		@image.delete
		respond_to do |format|
			if @image.delete
				format.js
			else
				format.html {notice:"При удалении данных произошла ошибка."}
			end
		end
	end
end
